import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference<Map<String, dynamic>> userRef =
    FirebaseFirestore.instance.collection('userRef');
