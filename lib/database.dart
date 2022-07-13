import 'task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  include(Task t) {
    final task = <String, dynamic>{"title": t.title, "calendar": t.calendar};
    firestore.collection("tasks").add(task).then(
        (DocumentReference doc) =>
            print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  delete(String id) {
    firestore.collection("tasks").doc(id).delete();
  }

  Future<List> list() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
          await firestore.collection('tasks').orderBy("title").get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "title": doc['title'], "calendar": doc["calendar"]};
          docs.add(a);
        }
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }
}
