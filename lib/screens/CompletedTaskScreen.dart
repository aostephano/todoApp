import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/MyAppState.dart';

class completedTaskScreen extends StatefulWidget {
  const completedTaskScreen({Key? key}) : super(key: key);

  @override
  State<completedTaskScreen> createState() => _completedTaskScreenState();
}

class _completedTaskScreenState extends State<completedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var taskList = appState.taskList;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Completed Tasks List:"),
          for (var task in appState.getDoneTasks(taskList))
            ListTile(
              leading:
                  IconButton(onPressed: () {}, icon: Icon(Icons.check_box)),
              title: Text(task.toString()),
            )
        ],
      ),
    );
  }
}
