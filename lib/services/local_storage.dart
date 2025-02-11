import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorageService {
  static const String key = "savedForms";

  // ✅ Save form data WITHOUT adding duplicates
  static Future<void> saveFormData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();

    // Get existing data or create a new empty list
    List<String> existingData = prefs.getStringList(key) ?? [];

    // Convert new data to JSON
    String newEntry = jsonEncode(data);

    // ✅ Prevent adding the same entry twice
    if (!existingData.contains(newEntry)) {
      existingData.add(newEntry);
    }

    // Save updated list
    await prefs.setStringList(key, existingData);
  }

  // ✅ Retrieve all saved data properly
  static Future<List<Map<String, dynamic>>> getAllSavedData() async {
    final prefs = await SharedPreferences.getInstance();

    // Get saved JSON list
    List<String> savedList = prefs.getStringList(key) ?? [];

    // Decode JSON into a List of Maps
    return savedList
        .map((item) => jsonDecode(item) as Map<String, dynamic>)
        .toList();
  }

  static init() {}
}
