import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/http_service.dart';
import 'package:myapp/listing_detail.dart';

import 'listing_model.dart';

class ListingsPage extends StatelessWidget{

  final HttpService httpService = HttpService();

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
                        subtitle: Text(listing.id.toString()),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ListingDetail(
                                  listing: listing,
                              )
                          )
                        ),
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
}

class MateralPageRoute {
}