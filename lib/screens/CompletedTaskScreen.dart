import 'package:flutter/material.dart';

class completedTaskScreen extends StatefulWidget {
  const completedTaskScreen({Key? key}) : super(key: key);

  @override
  State<completedTaskScreen> createState() => _completedTaskScreenState();
}

class _completedTaskScreenState extends State<completedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text("completed");
  }
}
