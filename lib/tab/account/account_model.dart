import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../domain/post.dart';

class AccountModel {
  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ?? '이름 없음';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://img.hankyung.com/photo/202203/01.29461103.1.jpg';
  }

  final Stream<QuerySnapshot<Post>> myPostsStreamOnly =
      FirebaseFirestore.instance
          .collection('posts')
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .withConverter<Post>(
            fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
            toFirestore: (post, _) => post.toJson(),
          )
          .snapshots();
}
