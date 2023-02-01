import 'package:firebase_auth/firebase_auth.dart';

class AccountModel {
  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? '이름 없음';
  }
}
