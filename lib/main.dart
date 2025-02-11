import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'services/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init(); //

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Form App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'screens/home_screen.dart';
// import 'services/local_storage.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await LocalStorageService.init(); // ✅ Initialize SharedPreferences
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Dynamic Form App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: HomeScreen(),
//     );
//   }
// }
