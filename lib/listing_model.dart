import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Listing {
  final int id;
  final String item;
  final int amount;
  // final DateTime expiryDate;


  Listing({
    required this.id,
    required this.item,
    required this.amount,
    // required this.expiryDate,
  });


  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
      id: json['id'] as int,
      item: json['item'] as String,
      amount: json['amount'] as int,
      // expiryDate:
    );
  }

}