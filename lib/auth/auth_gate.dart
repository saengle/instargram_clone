import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

import '../tab/tab_page.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // ...
        //데이터가 없다면 if 아래 수행해라.
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: [
              EmailProviderConfiguration(),
            ],
            headerBuilder: (context, constraints, _) {
              return const Text('Instagram Clone');
            },
          );
        }

        // Render your application if authenticated
        // 데이터가 있으면 아래 화면 표시해라
        return TabPage();
      },
    );
  }
}
