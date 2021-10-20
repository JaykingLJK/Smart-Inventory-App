import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/api/listing_service.dart';
import 'package:myapp/model/listing_model.dart';
import 'package:overlay_support/overlay_support.dart';

class CheckInManually extends StatefulWidget{

  @override
  _CheckInManually createState() => _CheckInManually();

}
class _CheckInManually extends State<CheckInManually>{

  final TextEditingController itemController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  ListingService listingService = ListingService();
  DateTime _myDateTime = DateTime.now();
  String time = DateTime.now().toString();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Check In Manually"),
      ), //AppBar
      body:Container(
        padding:const EdgeInsets.all(32),
        child: Column(
          children: [

            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter the item name'),
              controller: itemController,
            ), //TextField
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter the amount of item'),
              controller: amountController,
            ), //TextField
            Text(
                time,
                style: TextStyle(fontSize: 20)
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                _myDateTime = (await showDatePicker(
                  context: context,
                  initialDate: _myDateTime,
                  firstDate: DateTime(2018),
                  lastDate: DateTime(2028),
                ))!;
                setState((){
                  time = DateFormat('yyyy-MM-DD').format(_myDateTime);
                });
              },
              child: const Text('Enter item expiry date'),
            ),

            const SizedBox(height: 10),

          ], // []
        ), //column
      ), //container
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          String item = itemController.text;
          int amount = int.parse(amountController.text);
          listingService.addListing(item, amount, _myDateTime).then((response){
            showSimpleNotification(
              Text(response),
              background: Colors.purple,
              autoDismiss: false,
              trailing: Builder(builder: (context) {
                return TextButton(
                    onPressed: () {
                      OverlaySupportEntry.of(context)!.dismiss();
                    },
                    child: const Text('Dismiss'));
              }),
            );
          });
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.navigation),
        backgroundColor: Colors.green,
        label: const Text('Confirm'),
      ), //Floating Action Button
    ); //Scaffold
  }
}