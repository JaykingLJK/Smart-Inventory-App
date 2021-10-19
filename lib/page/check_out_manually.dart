import 'package:flutter/material.dart';
import 'package:myapp/api/listing_service.dart';
import 'package:myapp/model/listing_model.dart';


class CheckOutManually extends StatelessWidget{

  final TextEditingController itemController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  CheckOutManually({Key? key}) : super(key: key);

  get listingService => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Items to be checked out',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Items to be checked out'),
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
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    final String item = itemController.text;
    final String expiryDate = expiryDateController.text;
    final String amount = amountController.text;

    String response = listingService.takeListing();

    // setState(() {
    //   _listing = listing;  //unsure of this part
    //
    // });

    },
    child: const Text("Submit")

    ), //Floating Action Button
    ); //Scaffold
  }
}