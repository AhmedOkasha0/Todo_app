import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/model/task.dart';

CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance.collection('task').withConverter<Task>(
      fromFirestore: ((snapshot, option) => Task.fromJson(snapshot.data()!)),
      toFirestore: (task, option) => task.toJson());
}

Future <void> addTaskToFire(Task task) {
  var collection = getTaskCollection();
  var docReference= collection.doc();
  task.id=docReference.id;
 return docReference.set(task);
}
  Future<void> deletTaskFromFireStore(Task task){
 return getTaskCollection().doc(task.id).delete();

}
