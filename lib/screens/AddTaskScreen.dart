import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/Task.dart';
import '../provider/MyAppState.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _textFieldController = TextEditingController();
  String newTask = '';

  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

  //disposing the controller
  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _submit() {
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var taskList = appState.taskList;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: _textFieldController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your task',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                //Insert new Task on Provider
                newTask = _textFieldController.text;
                Task taskInstance = Task(newTask, false);
                appState.addTask(taskInstance);
                _submit();
              },
              child: Text("Add"))
        ],
      ),
    );
  }

  doNothing() {}
}
