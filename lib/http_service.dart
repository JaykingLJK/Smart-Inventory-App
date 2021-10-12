import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'listing_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String urlListings = "http://54.151.224.79:5000/listings";

  Future<void> deleteListing(int id) async{
    Response res = await http.delete(Uri.parse(urlListings), body: id);
    if (res.statusCode == 200){
      print("Deleted");
    }
  }

  Future<List<Listing>> getListings() async {
    http.Response res = await http.get(
      Uri.parse(urlListings),
      headers: {
        "Access-Control-Allow-Origin": "*"
      });
    if (res.statusCode == 200){
      List<dynamic> body = jsonDecode(res.body);

      List<Listing> listings = body.map((dynamic item) => Listing.fromJson(item)).toList();

      return listings;
    }
    else{
      throw "Can't get listings.";
    }
  }
}