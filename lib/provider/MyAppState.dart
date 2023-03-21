import 'dart:collection';

import 'package:flutter/material.dart';
import '../model/Task.dart';

class MyAppState extends ChangeNotifier {
  List<Task> taskList = <Task>[];

  getDoneTasks(taskList) {
    List doneTaskList = taskList.where((task) => task.done == true).toList();
    return doneTaskList;
  }

  addTask(taskInstance) {
    taskList.add(taskInstance);
    notifyListeners();
  }

  //we are not working with task id that why we are working with every tasks index number to modify
  void toggleTask(Task task) {
    final taskIndex = taskList.indexOf(task);
    taskList[taskIndex].taskDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    taskList.remove(task);
    notifyListeners();
  }
}
