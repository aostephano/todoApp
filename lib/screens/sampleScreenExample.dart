import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/MyAppState.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textFieldController = TextEditingController();
  String newTask = '';
  //creating initState() for adding listener to controller
  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

  //disposing the object controller
  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _submit() {
    //we aren't interested in updating our ui so listen will be false
    Provider.of<MyAppState>(context, listen: false).addTask(newTask);
    //cancelling the dialog
    Navigator.pop(context);
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> showAddTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Add a new Task"),
              content: TextField(
                autofocus: true,
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "Add New Task"),
                onSubmitted: (_) => _submit(),
              ),
              actions: [
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Submit"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40)),
                )
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              actionsAlignment: MainAxisAlignment.center,
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
      ),
      body: TodoAction(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          showAddTextDialog();
        }),
        child: const Icon(Icons.add),
        tooltip: "Add a todo",
      ),
    );
  }
}

class TodoAction extends StatefulWidget {
  const TodoAction({Key? key}) : super(key: key);

  @override
  State<TodoAction> createState() => _TodoActionState();
}

class _TodoActionState extends State<TodoAction> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
