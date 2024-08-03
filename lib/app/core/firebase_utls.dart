import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/app/models/app_user.dart';
import 'package:todo_app/app/models/task.dart';

class FirebaseManager {
  // 1. Make A firebase instance
  // 2. Call your collection
  static CollectionReference<Task> getTasksCollections({required String uId}) {
    // return map<string, dynamic>
    return getUsersCollectiosn()
        .doc(uId)
        .collection(
            Task.collectionName) // Create collection tasks if not exists
        .withConverter<Task>(
            fromFirestore: (snapshot, options) =>
                Task.fromFirestore(snapshot.data()!),
            toFirestore: (task, options) => task.toFirestore());
  }

  static Future<void> addTaskToFirestore(
      {required Task task, required String uId}) {
    // Get the collection
    var taskCollectionRef = getTasksCollections(uId: uId);
    // Make a document
    DocumentReference<Task> taskDocRef = taskCollectionRef.doc();
    task.id = taskDocRef.id;
    return taskDocRef.set(task);
    // Seconad Way
    // return getTasksCollections(uId: uId)
    //     .doc(getTasksCollections(uId: uId).doc().id)
    //     .set(task);
  }

  static Future<void> deleteTaskFromFirestore({required task, required uId}) {
    return getTasksCollections(uId: uId).doc(task.id).delete();
  }

  static CollectionReference<AppUser> getUsersCollectiosn() {
    // withConverter بتعرف الفايربيز نوع الداتا الى هتخزنها
    return FirebaseFirestore.instance
        .collection(AppUser.collectionName)
        .withConverter(
            fromFirestore: (snapshot, options) => AppUser.fromFirestore(
                  snapshot.data()!,
                ),
            toFirestore: (user, options) => user.toFirestore());
  }

  static Future<void> addUserToFireStore(AppUser user) {
    // 1.Get Your Collection Name
    // 2.Make A Document
    // 3.Add User ID
    return getUsersCollectiosn().doc(user.id).set(user);
  }

  static Future<AppUser?> getUser(String uId) async {
    var querySnapshot = await getUsersCollectiosn().doc(uId).get();
    return querySnapshot.data();
  }
}
