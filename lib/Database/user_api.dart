import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estartup/database/auth_methods.dart';
import 'package:estartup/models/app_user.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserAPI {
  static const String _collection = 'users';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Future<bool> addUser(AppUser appUser) async {
    try {
      await _instance
          .collection(_collection)
          .doc(appUser.uid)
          .set(appUser.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<AppUser?> getInfo({required String uid}) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await _instance.collection(_collection).doc(uid).get();
    if (!doc.exists) return null;
    return AppUser.fromDoc(doc);
  }

  Future<String?> uploadImage({required File file}) async {
    try {
      TaskSnapshot snapshot = await FirebaseStorage.instance
          .ref(
              'users/${AuthMethods.uid()}/${DateTime.now().microsecondsSinceEpoch}')
          .putFile(file);
      String url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (e) {
      return null;
    }
  }
}
