import 'package:flutter/material.dart';
import 'screens/menu_entry.dart';

void main() => runApp(HotelMenuApp());

class HotelMenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Menu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MenuEntryScreen(),
    );
  }
}
