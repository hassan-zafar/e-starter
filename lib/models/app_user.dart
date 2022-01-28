import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estartup/enums/idea_status_enum.dart';
import 'package:estartup/models/idea.dart';

class AppUser {
  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    this.isEntrepreneur = true,
    this.rating = 0,
    this.status = true,
    this.imageURL = '',
    required this.ideas,
  });
  final String uid;
  final String name;
  final String email;
  final bool isEntrepreneur;
  final String? imageURL;
  final double? rating;
  final bool? status;
  final List<Idea>? ideas;

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'isEntrepreneur': isEntrepreneur,
      'imageURL': imageURL,
      'rating': rating,
      'status': status,
      'ideas': [],
    };
  }

  factory AppUser.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return AppUser(
      uid: doc.data()!['uid'] ?? '',
      name: doc.data()!['name'] ?? '',
      email: doc.data()!['email'] ?? '',
      isEntrepreneur: doc.data()!['isEntrepreneur'] ?? true,
      imageURL: doc.data()!['imageURL'],
      rating: double.parse(doc.data()!['rating'].toString()),
      status: doc.data()!['status'] ?? true,
      ideas: doc.data()!['ideas'] != null ? [] : null,
    );
  }
}
