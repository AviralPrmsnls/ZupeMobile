import 'package:flutter/material.dart';
import 'package:zupe/pages/FirstPage.dart';
import 'package:zupe/pages/homePage/homePagemodified.dart';
import 'package:zupe/service/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/homePage/homePage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBjumzbfRA7lylThLPaNGPsNi7Yifpr8Eo",
          authDomain: "zupe-the-last-app.firebaseapp.com",
          projectId: "zupe-the-last-app",
          storageBucket: "zupe-the-last-app.appspot.com",
          messagingSenderId: "95747613245",
          appId: "1:95747613245:web:efdb675b1bdc5ef4764054",
          measurementId: "G-76E6LY6V0J"));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TabBarProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zupe',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirstPage());
  }
}
