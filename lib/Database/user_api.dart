import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estarter1/Models/users.dart';
import 'package:estarter1/Tools/custom_toast.dart';

class UserAPI {
  static const String _collection = 'users';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;
  // functions
  Future<DocumentSnapshot<Map<String, dynamic>>> getInfo(
      {required String uid}) async {
    return _instance.collection(_collection).doc(uid).get();
  }

  Future<bool> addUser(AppUserModel appUser) async {
    await _instance
        .collection(_collection)
        .doc(appUser.id)
        .set(appUser.toMap())
        .catchError((Object e) {
      CustomToast.successToast(message: e.toString());
      // ignore: invalid_return_type_for_catch_error
      return false;
    });
    return true;
  }
}
