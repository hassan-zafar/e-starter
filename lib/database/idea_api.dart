import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estartup/models/idea.dart';
import 'package:estartup/widgets/custom_toast.dart';

class IdeaAPI {
  static const String _collection = 'ideas';
  static final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Future<bool> addIdea(Idea idea) async {
    try {
      await _instance.collection(_collection).doc().set(idea.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Idea>> feed() async {
    List<Idea> _idea = <Idea>[];
    try {
      QuerySnapshot<Map<String, dynamic>> _docs = await _instance
          .collection(_collection)
          .orderBy("timestamp", descending: false)
          .get();
      for (DocumentSnapshot<Map<String, dynamic>> element in _docs.docs) {
        _idea.add(Idea.fromDoc(element));
      }
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
    }

    return _idea;
  }

  Future<Idea?> idea({required String id}) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await _instance.collection(_collection).doc(id).get();
    if (!doc.exists) return null;
    return Idea.fromDoc(doc);
  }

  Future<List<Idea>> userIdeas({required String uid}) async {
    List<Idea> _idea = <Idea>[];
    try {
      QuerySnapshot<Map<String, dynamic>> _docs = await _instance
          .collection(_collection)
          .where("uid", isEqualTo: uid)
          .get();
      for (DocumentSnapshot<Map<String, dynamic>> element in _docs.docs) {
        _idea.add(Idea.fromDoc(element));
      }
    } catch (e) {
      CustomToast.errorToast(message: e.toString());
    }
    return _idea;
  }
}
