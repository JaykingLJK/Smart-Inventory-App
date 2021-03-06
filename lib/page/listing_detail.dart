import 'package:flutter/material.dart';
import 'package:myapp/api/listing_service.dart';
import 'package:myapp/page/listings.dart';
import 'package:overlay_support/overlay_support.dart';

import '../model/listing_model.dart';

class ListingDetail extends StatelessWidget{
  final Listing listing;
  final ListingService listingService = ListingService();
  ListingDetail({Key? key,
    required this.listing
}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(listing.item),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String response = "Default Response";
          listingService.deleteListing(listing).then((response){
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
          Navigator.pop(context, true);
              },
        child: const Icon(
          Icons.delete,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
              12.0
          ),
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text("Item Name"),
                  subtitle: Text(listing.item),
                ),
                ListTile(
                  title: const Text("Item Amount"),
                  subtitle: Text(listing.amount.toString()),
                ),
                ListTile(
                  title: const Text("Expiry Date"),
                  subtitle: Text(listing.expiryDate),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}