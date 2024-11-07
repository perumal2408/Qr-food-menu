import 'package:flutter/material.dart';
import 'dart:convert';  // To decode JSON

class MenuDisplayScreen extends StatelessWidget {
  final List<Map<String, String>> menuItems;

  MenuDisplayScreen(this.menuItems);

  // Decode the JSON data from QR code (This is where you handle the scanned QR data)
  List<Map<String, String>> _parseQrData(String qrData) {
    // Decode the JSON string back into a list of menu items
    final List<dynamic> jsonList = jsonDecode(qrData);
    return jsonList.map((item) => Map<String, String>.from(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Display')),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            child: ListTile(
              title: Text(item['name']!),
              subtitle: Text('${item['description']} - ${item['price']}'),
            ),
          );
        },
      ),
    );
  }
}
