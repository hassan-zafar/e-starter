import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estartup/database/auth_methods.dart';
import 'package:estartup/enums/idea_status_enum.dart';

class Idea {
  final String? ideaID;
  final String? uid;
  final String title;
  final String description;
  final List<String> documents;
  final IdeaStatusEnum? status;
  final String? timestamp;
  final List<String>? interested;
  final List<String>? chats;
  final List<String>? keywords;
  final String? fileUrl;
  Idea({
    this.ideaID,
    this.uid,
    this.fileUrl,
    required this.title,
    required this.description,
    required this.documents,
    this.status,
    this.timestamp,
    this.interested,
    this.chats,
    this.keywords,
  });

  Map<String, dynamic> toMap() {
    final _time = DateTime.now().microsecondsSinceEpoch.toString();
    final String? _uid = AuthMethods.uid();
    return {
      'ideaID': '${_uid!}$_time',
      'uid': _uid,
      'title': title,
      'description': description,
      'fileUrl': fileUrl,
      'documents': documents,
      'status':
          IdeaStatusConvertor.fromEnum(status ?? IdeaStatusEnum.AVAILABLE),
      'timestamp': timestamp ?? _time,
      'interested': interested ?? [],
      'chats': chats ?? [],
      'keywords': keywords ?? [],
    };
  }

  factory Idea.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Idea(
      ideaID: doc.data()!['ideaID'] ?? '',
      uid: doc.data()!['uid'] ?? '',
      title: doc.data()!['title'] ?? '',
      fileUrl: doc.data()!['fileUrl'] ?? '',
      description: doc.data()!['description'] ?? '',
      documents: List<String>.from(doc.data()!['documents']),
      status: doc.data()!['status'] != null
          ? IdeaStatusConvertor.fromString((doc.data()!['status']))
          : null,
      timestamp: doc.data()!['timestamp'] ?? '',
      interested: List<String>.from(doc.data()!['interested']),
      chats: List<String>.from(doc.data()!['chats']),
      keywords: List<String>.from(doc.data()!['keywords']),
    );
  }
}
