import 'dart:html';

import 'package:myapp/page/check_out_manually.dart';

import '../func/scanner.dart';
import 'package:flutter/material.dart';
import 'package:myapp/api/listing_service.dart';

import '../model/listing_model.dart';

class CheckOutOption extends StatelessWidget {
  final Scanner scanner = Scanner();
  final ListingService listingService = ListingService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Check Out Option Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Align(
                alignment: Alignment.center,
                child: Text('Choose a check-in method',
                    style: TextStyle(
                      fontSize: 18.0,
                    )
                )
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(40.0),
              color: Colors.grey[100],
              child: ElevatedButton.icon(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => CheckOutManually()
                    )
                )
                ,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(400, 50),
                  maximumSize: const Size(400, 50),
                ),
                icon: const Icon(
                  Icons.add_circle,
                  size: 25.0,
                ),
                label: const Text(
                  'Check Out Manually',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(40.0),
              color: Colors.grey[100],
              child: ElevatedButton.icon(
                onPressed: () {
                  String item = scanner.scanBarcodeNormal();
                  listingService.takeListing(item, 1);
                }
                // => Navigator.of(context).push(
                // MaterialPageRoute(
                //     builder: (context) => CheckInOption()
                // )
                // )
                ,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(400, 50),
                  maximumSize: const Size(400, 50),
                ),
                icon: const Icon(
                  Icons.add_circle,
                  size: 25.0,
                ),
                label: const Text(
                  'Check Out With Camera',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}