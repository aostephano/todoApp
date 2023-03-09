import 'package:flutter/material.dart';
import '../model/Task.dart';

class MyAppState extends ChangeNotifier {
  List<Task> taskList = <Task>[];

  addTask(taskTitle) {
    Task taskElement = Task(taskTitle, false);
    taskList.add(taskElement);
  }
}
