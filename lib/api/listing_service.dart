import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../model/listing_model.dart';
import 'package:http/http.dart' as http;
import '../model/listing_model.dart';

class ListingService {
  final String urlListings = "http://54.151.224.79:5000/listings";

  Future<String> takeListing(String item, int amount) async{
    Response res = await http.delete(Uri.parse(urlListings), body: {"item": item, "amount": amount});
    if (res.statusCode == 200){
      Map<String, dynamic> body = jsonDecode(res.body);
      String itemItem = body["item"];
      int amountAmount = body["amount"];
      List<Listing> listings = body["lst"].map((dynamic item) => Listing.fromJson(item)).toList();
      String notification = "";
      for(var listing in listings){
        notification += "${listing.amount} of ${listing.item} expiring by ${listing.expiryDate} have been taken out.\n";
      }
      return "$amountAmount of $itemItem have been taken out.\ndetails:\n" + notification;
    }
    else{
      return "Error when taking out the listing";
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