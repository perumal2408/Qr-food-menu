import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:convert';  // For JSON encoding

class QrGeneratorScreen extends StatelessWidget {
  final List<Map<String, String>> menuItems;

  QrGeneratorScreen(this.menuItems);

  // Method to generate the QR Code Data as JSON
  String _generateQrData() {
    // Convert the menu items list to JSON format and return it
    return jsonEncode(menuItems);
  }

  @override
  Widget build(BuildContext context) {
    final qrData = _generateQrData(); // Get the JSON data

    return Scaffold(
      appBar: AppBar(title: Text('Generate QR Code')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the QR code with the JSON data
            QrImageView(
              data: qrData,  // The JSON data will be embedded in the QR code
              size: 200.0,
            ),
            SizedBox(height: 16),
            Text('Scan this QR code to view the menu'),
          ],
        ),
      ),
    );
  }
}
