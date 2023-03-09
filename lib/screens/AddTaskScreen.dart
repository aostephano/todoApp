import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/MyAppState.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController textController = TextEditingController();
  String taskTitle = "";

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var taskList = appState.taskList;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: textController,
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
                taskTitle = textController.text;
                appState.addTask(taskTitle);
              },
              child: Text("Adicionar"))
        ],
      ),
    );
  }

  doNothing() {}
}
