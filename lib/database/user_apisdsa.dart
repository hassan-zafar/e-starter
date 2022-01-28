// import 'dart:typed_data';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import '../models/entrepreneur.dart';
// import '../widgets/custom_toast.dart';
// import 'user_local_data.dart';

// class UserAPI {
//   static const String _collection = 'users';
//   static final FirebaseFirestore _instance = FirebaseFirestore.instance;
//   // functions
//   Future<AppUser> getInfo({required String uid}) async {
//     final DocumentSnapshot<Map<String, dynamic>> doc =
//         await _instance.collection(_collection).doc(uid).get();
//     return AppUser.fromDocument(doc);
//   }

//   Future<bool> addUser(AppUser appUser) async {
//     await _instance
//         .collection(_collection)
//         .doc(appUser.uid)
//         .set(appUser.toMap())
//         .catchError((Object e) {
//       CustomToast.errorToast(message: e.toString());
//       // ignore: invalid_return_type_for_catch_error
//       return false;
//     });
//     return true;
//   }

//   Future<String> uploadImage(Uint8List? imageBytes, String uid) async {
//     TaskSnapshot snapshot = await FirebaseStorage.instance
//         .ref()
//         .child('profile_images/$uid')
//         .putData(imageBytes!);
//     String url = (await snapshot.ref.getDownloadURL()).toString();
//     return url;
//   }

//   Future<List<AppUser>> getallfirebaseusersbyname(String name) async {
//     List<AppUser> users = <AppUser>[];
//     QuerySnapshot<Map<String, dynamic>> snapshot =
//         await FirebaseFirestore.instance.collection(_collection).get();

//     List<DocumentSnapshot<Map<String, dynamic>>> docs = snapshot.docs;
//     for (DocumentSnapshot<Map<String, dynamic>> doc in docs) {
//       AppUser appUser = AppUser.fromDocument(doc);
//       if (appUser.name.contains(name)) {
//         users.add(appUser);
//       }
//     }
//     return users;
//   }

//   Future<void> addpostcount(String digilogId) async {
//     List<String> posts = UserLocalData.getPost;
//     posts.add(digilogId);
//     await _instance
//         .collection(_collection)
//         .doc(UserLocalData.getUID)
//         .update(<String, dynamic>{'posts': posts});
//   }
// }