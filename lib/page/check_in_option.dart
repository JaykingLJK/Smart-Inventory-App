import '../func/scanner.dart';
import 'package:flutter/material.dart';
import 'package:myapp/api/listing_service.dart';

import '../model/listing_model.dart';

class CheckInOption extends StatelessWidget {
  final Listing listing;
  final Scanner scanner = Scanner();

  CheckInOption({Key? key,
    required this.listing
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a check-in method'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          scanner.scanBarcodeNormal();
        },
        child: const Icon(
          Icons.camera,
        ),
      ),
    );
  }


}