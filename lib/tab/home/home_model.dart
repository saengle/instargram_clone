import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class HomeModel {
  final _picker = ImagePicker();

  Future<void> updateProfileImage() async {
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      // 이미지 업로드
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child(
          'user/${FirebaseAuth.instance.currentUser?.uid}/profile/${DateTime.now().millisecondsSinceEpoch}.png');
      // 이미지 url 을 얻기
      await imageRef.putFile(File(xFile.path));

      final downloadUrl = await imageRef.getDownloadURL();
      // 업데이트
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(downloadUrl);
    }
  }

  String getEmail() {
    return FirebaseAuth.instance.currentUser?.email ?? '메일 없음';
  }

  String getNickName() {
    return FirebaseAuth.instance.currentUser?.displayName ??
        '이름이 등록되어 있지 않습니다.';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://img.hankyung.com/photo/202203/01.29461103.1.jpg';
  }
}
