import 'package:flutter/material.dart';
import 'package:myapp/api/listing_service.dart';

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
          listingService.takeListing(listing.item, listing.amount);
          Navigator.of(context).pop();
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
                  title: const Text("Item Id"),
                  subtitle: Text(listing.id.toString()),
                ),
                ListTile(
                  title: const Text("Item Amount"),
                  subtitle: Text(listing.amount.toString()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}