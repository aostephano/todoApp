import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/MyAppState.dart';

class ListTaskScreen extends StatefulWidget {
  const ListTaskScreen({Key? key}) : super(key: key);

  @override
  State<ListTaskScreen> createState() => _ListTaskScreenState();
}

class _ListTaskScreenState extends State<ListTaskScreen> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var taskList = appState.taskList;

    return Consumer<MyAppState>(
      builder: (context, storedValue, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("To Do List"),
              for (var element in taskList)
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: element.done
                        ? Icon(Icons.check_box)
                        : Icon(Icons.check_box_outline_blank),
                  ),
                  title: Text(element.toString()),
                )
            ],
          ),
        );
      },
    );
  }
}
