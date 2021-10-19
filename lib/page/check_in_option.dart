import 'package:myapp/page/check_in_manually.dart';

import '../func/scanner.dart';
import 'package:flutter/material.dart';
import 'package:myapp/api/listing_service.dart';

import '../model/listing_model.dart';

class CheckInOption extends StatelessWidget {
  final Scanner scanner = Scanner();
  final ListingService listingService;

  CheckInOption({Key? key, required this.listingService,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
        title: const Text('Check In Option Page'),
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Choose a check-in method',
                style: TextStyle(
                  fontSize: 18.0,
                )
            ),
            Container(
              padding: const EdgeInsets.all(40.0),
              color: Colors.grey[100],
              child: ElevatedButton.icon(
                onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => CheckInManually(listingService: listingService,)
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
                  'Check In Manually',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
      Container(
        padding: const EdgeInsets.all(40.0),
        color: Colors.grey[100],
        child: ElevatedButton.icon(
          onPressed: () {}
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
            'Check In With Camera',
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