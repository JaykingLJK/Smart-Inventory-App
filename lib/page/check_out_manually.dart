import 'package:flutter/material.dart';
import 'package:myapp/api/listing_service.dart';
import 'package:myapp/model/listing_model.dart';
import 'package:overlay_support/overlay_support.dart';


class CheckOutManually extends StatelessWidget{

  final TextEditingController itemController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  ListingService listingService = ListingService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Check Out Manually"),
      ),
      body:Container(
        padding:const EdgeInsets.all(32),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: 'Enter the item name'),
              controller: itemController,
            ),
            TextField(
              decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: 'Enter the amount of item'),
              controller: amountController,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    floatingActionButton: FloatingActionButton.extended(
    onPressed: () {
      String item = itemController.text;
      int amount = int.parse(amountController.text);
      listingService.takeListing(item, amount).then((response){
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
    ),
    );
  }
}