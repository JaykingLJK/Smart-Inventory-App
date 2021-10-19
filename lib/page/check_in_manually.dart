import 'package:flutter/material.dart';
import 'package:myapp/api/listing_service.dart';
import 'package:myapp/model/listing_model.dart';


class CheckInManually extends StatelessWidget{

  final TextEditingController itemController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  CheckInManually({Key? key, required this.listingService}) : super(key: key);

  final ListingService listingService;

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
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter the item expiry date'),
              controller: expiryDateController,
            ), //TextField

            const SizedBox(height: 10),

          ], // []
        ), //column
      ), //container
      floatingActionButton: FloatingActionButton(
          onPressed: () async{
            String item = itemController.text;
            int amount = int.parse(amountController.text);
            DateTime expiryDate = DateTime.parse(expiryDateController.text);

            String listing = listingService.addListing(item, amount, expiryDate);

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