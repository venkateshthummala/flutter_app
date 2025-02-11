import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'form_screen.dart';
import 'view_data_screen.dart';
import '../models/form_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FormModel? formModel;

  Future<void> loadJson() async {
    String jsonString = await rootBundle.loadString('assets/form.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    setState(() {
      formModel = FormModel.fromJson(jsonData['data']);
    });
  }

  @override
  void initState() {
    super.initState();
    loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dynamic Form App",
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor: Color.fromRGBO(23, 107, 191, 1),
      ),
      body: formModel == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Text(
                  formModel!.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FormScreen(formModel!),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("Start Form"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ViewDataScreen(),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("View Saved Data"),
                  ),
                ),
              ],
            ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:convert';
// import 'form_screen.dart';
// import 'view_data_screen.dart';
// import '../models/form_model.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   FormModel? formModel;

//   Future<void> loadJson() async {
//     String jsonString = await rootBundle.loadString('assets/hnicustomersmet.json');
//     Map<String, dynamic> jsonData = json.decode(jsonString);
//     setState(() {
//       formModel = FormModel.fromJson(jsonData['data']);
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     loadJson();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Dynamic Form App")),
//       body: formModel == null
//           ? Center(child: CircularProgressIndicator())
//           : Column(
//               children: [
//                 Text(
//                   formModel!.name,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => FormScreen(formModel!),
//                     ),
//                   ),
//                   child: Text("Start Form"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => ViewDataScreen(),
//                     ),
//                   ),
//                   child: Text("View Saved Data"),
//                 ),
//               ],
//             ),
//     );
//   }
// }