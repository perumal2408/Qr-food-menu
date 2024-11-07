import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MenuService {
  static const String menuKey = 'menuItems';

  static Future<void> saveMenu(List<Map<String, String>> menuItems) async {
    final prefs = await SharedPreferences.getInstance();
    final menuJson = jsonEncode(menuItems);
    await prefs.setString(menuKey, menuJson);
  }

  static Future<List<Map<String, String>>> loadMenu() async {
    final prefs = await SharedPreferences.getInstance();
    final menuJson = prefs.getString(menuKey);
    if (menuJson != null) {
      final List<dynamic> decoded = jsonDecode(menuJson);
      return decoded.map((item) => Map<String, String>.from(item)).toList();
    }
    return [];
  }
}
