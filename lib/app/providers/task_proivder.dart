import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app/core/firebase_utls.dart';

import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> taskList = [];
  DateTime selectedDate = DateTime.now();
  void getAllTasks({required String uId}) async {
    QuerySnapshot<Task> querySnapshot =
        await FirebaseManager.getTasksCollections(uId: uId).get();
    taskList = querySnapshot.docs.map((doc) => doc.data()).toList();
    taskList = taskList.where((task) => task.date == selectedDate).toList();
    // taskList.sort((task1, task2) => task1.date!.compareTo(task2.date!));
    notifyListeners();
  }

  void changeSelectedDate({required date, required String uId}) {
    selectedDate = date;
    getAllTasks(uId: uId);
    // we remove notifyListeners as we do it on the get all tasks
    // notifyListeners();
  }
}
