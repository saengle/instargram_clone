import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instargram_clone/firebase_options.dart';
import 'auth/auth_gate.dart';

import 'tab/tab_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.black,
      ),
      home: AuthGate(),
    );
  }
}
