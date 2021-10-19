// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/api/listing_service.dart';
import 'package:myapp/page/home.dart';
import 'package:myapp/page/listings.dart';
import 'api/listing_service.dart';
import 'model/listing_model.dart';


late final ListingService listingService;
void main() => runApp(MyApp(listingService: listingService));

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.listingService}) : super(key: key);
  final ListingService listingService;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart-Inventory-System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Homepage(listingService: listingService,), // Change the home page here.
    );
  }
}

