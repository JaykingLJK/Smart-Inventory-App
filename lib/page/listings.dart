import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/api/listing_service.dart';
import 'package:myapp/page/listing_detail.dart';

import '../model/listing_model.dart';

class ListingsPage extends StatefulWidget {
  @override
  _ListingsPage createState() => _ListingsPage();

}

class _ListingsPage extends State<ListingsPage>{

  final ListingService httpService = ListingService();
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listings"),
      ),
      body: FutureBuilder(
        future: httpService.getListings(),
        builder: (BuildContext context, AsyncSnapshot<List<Listing>> snapshot){
          if(snapshot.hasData){
            List<Listing>? listings = snapshot.data;
            return ListView(
              children: listings!
                  .map(
                      (Listing listing) => ListTile(
                        title: Text(listing.item),
                        subtitle: Text(listing.amount.toString()),
                        trailing: Text(listing.expiryDate),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ListingDetail(
                                  listing: listing,
                              )
                          )
                        ).then(onGoBack),
                      )
              ).toList(),
            );
          }
          // return const Center(child: CircularProgressIndicator(),);
          return Text('${snapshot.error}');
        },
      ),
    );
  }


  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

}
