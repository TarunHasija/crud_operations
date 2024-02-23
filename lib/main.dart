import 'package:crud_operations/firebase_options.dart';
import 'package:crud_operations/homepage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(DevicePreview(
    
    builder: (context) => MyApp(
      
    ), // Wrap your app
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        
        primarySwatch: Colors.blue,
        hintColor: Colors.red,
      ),
      home:  MyHomePage(),
    );
  }
}

