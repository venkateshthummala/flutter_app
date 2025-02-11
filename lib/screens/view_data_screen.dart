import 'package:flutter/material.dart';
import '../services/local_storage.dart';

class ViewDataScreen extends StatefulWidget {
  @override
  _ViewDataScreenState createState() => _ViewDataScreenState();
}

class _ViewDataScreenState extends State<ViewDataScreen> {
  List<Map<String, dynamic>> savedDataList = [];

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  void loadSavedData() async {
    List<Map<String, dynamic>> data =
        await LocalStorageService.getAllSavedData();
    setState(() {
      savedDataList = data.toSet().toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Saved Data")),
      body: savedDataList.isEmpty
          ? Center(child: Text("No saved data found"))
          : ListView.builder(
              itemCount: savedDataList.length,
              itemBuilder: (context, index) {
                var data = savedDataList[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.blue),
                    title: Text(
                        "Name: ${data['Name of the Customer'] ?? 'N/A'}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle:
                        Text("Mobile: ${data['Contact Number'] ?? 'N/A'}"),
                  ),
                );
              },
            ),
    );
  }
}
