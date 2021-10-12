import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Scanner {

  Future<String> scanBarcodeNormal() async {
    String _scanBarcode = 'unknown';
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      // print(barcodeScanRes);
      _scanBarcode = barcodeScanRes;
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
      _scanBarcode = barcodeScanRes;
    }

    return _scanBarcode;
  }
}