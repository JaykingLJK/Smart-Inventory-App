import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../func/scanner.dart';
import 'package:myapp/api/listing_service.dart';
import 'package:myapp/page/listings.dart';
import '../model/listing_model.dart';


class HomePage extends StatelessWidget {
  late final Listing listing;
  final Scanner scanner = Scanner();
  HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),

      // add navigator button here.

    );
  }


}