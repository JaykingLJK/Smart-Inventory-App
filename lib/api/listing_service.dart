import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../model/listing_model.dart';
import 'package:http/http.dart' as http;
import '../model/listing_model.dart';

class ListingService {
  final String urlListings = "http://54.151.224.79:5000/listings";
  final String urlListingDelete = "http://54.151.224.79:5000/listingdelete";


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


  String addListing(String item, int amount, DateTime expiryDate){
    String notification = "";
    Response res = Response("Default Response", 300);
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    String expiry_date = dateFormat.format(expiryDate);
    var reqBody = jsonEncode({"item": item, "amount": amount, "expiry_date": expiry_date});
    http.post(Uri.parse(urlListings), body: reqBody).then((value){
      res = value;
    });
    if (res.statusCode == 200){
      Map<String, dynamic> resBody = jsonDecode(res.body);
      String itemItem = resBody["item"];
      int amountAmount = resBody["amount"];
      String dateDate = resBody["expiry_date"];
      return "$amountAmount of $itemItem expiring by $dateDate have been added to the inventory";
    }
    else{
      return "Error when adding the listing.";
    }
  }


  String takeListing(String item, int amount) {
    var reqBody = jsonEncode({"item": item, "amount": amount});
    Response res = Response("Default Response", 200);
    http.delete(Uri.parse(urlListings), body: reqBody).then((value){
      res = value;
    });
    if (res.statusCode == 200){
      Map<String, dynamic> resBody = jsonDecode(res.body);
      String itemItem = resBody["item"];
      int amountAmount = resBody["amount"];
      List<dynamic> listings = resBody["lst"];
      String notification = "";
      for(dynamic _listing in listings){
        Listing listing = Listing.fromJson(_listing);
        notification += "${listing.amount} of ${listing.item} expiring by ${listing.expiryDate} have been taken out.\n";
      }
      return "$amountAmount of $itemItem left after checking out.\ndetails:\n" + notification;
    }
    else{
      return "Error when taking out the listing.";
    }
  }

  String updateListing(Listing listing) {
    String notification = "";
    Response res = Response("Default Response", 300);
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    var reqBody = jsonEncode({"id": listing.id, "item": listing.item, "amount": listing.amount, "expiry_date": listing.expiryDate});
    http.put(Uri.parse(urlListings), body: reqBody).then((value){
      res = value;
    });
    if (res.statusCode == 200){
      Map<String, dynamic> resBody = jsonDecode(res.body);
      String itemItem = resBody["item"];
      int amountAmount = resBody["amount"];
      String dateDate = resBody["expiry_date"];
      return "$amountAmount of $itemItem expiring by $dateDate have been updated successfully.";
    }
    else{
      return "Error when updating the listing.";
    }
  }

  String deleteListing(Listing listing) {
    var reqBody = jsonEncode({"item":listing.item, "amount":listing.amount, "id":listing.id});
    Response res = Response("Default Response", 200);
    http.delete(Uri.parse(urlListings), body: reqBody).then((value){
      res = value;
    });
    if (res.statusCode == 200){
      Map<String, dynamic> resBody = jsonDecode(res.body);
      String notification = "${listing.amount} of ${listing.item} expiring by ${listing.expiryDate} have been deleted.\n";
      return "0 of ${listing.item} left after checking out.\ndetails:\n" + notification;
    }
    else{
      return "Error when deleting the listing";
    }
  }

}