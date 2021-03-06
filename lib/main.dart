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
import 'package:overlay_support/overlay_support.dart';
import 'api/listing_service.dart';
import 'model/listing_model.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key,}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: MaterialApp(
        title: 'Smart-Inventory-System',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Homepage(), // Change the home page here.
    )
    );
  }
}

