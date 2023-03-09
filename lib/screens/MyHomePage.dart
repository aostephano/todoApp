import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'AddTaskScreen.dart';
import 'CompletedTaskScreen.dart';
import 'ListTaskScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Return to Add Page/Navybar
          _currentIndex = 0;
          _pageController.jumpToPage(0);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text("To Do App")),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
            AddTaskScreen(),
            ListTaskScreen(),
            completedTaskScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(title: Text('Add Tasks'), icon: Icon(Icons.home)),
          BottomNavyBarItem(title: Text('List Tasks'), icon: Icon(Icons.apps)),
          BottomNavyBarItem(
              title: Text('Completed Tasks'), icon: Icon(Icons.chat_bubble)),
        ],
      ),
    );
  }
}
