import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Task extends ChangeNotifier {
  //Atributes
  late String _taskName;
  late bool _done = false;

  //Constructor
  Task(this._taskName, this._done);

  //Setters and Getters
  String get taskName => _taskName;

  set taskName(String value) {
    _taskName = value;
  }

  bool get done => _done;

  set done(bool value) {
    _done = value;
  }

  //Methods
  @override
  String toString() {
    return taskName;
  }

  taskDone() {
    done = !done;
  }
}
