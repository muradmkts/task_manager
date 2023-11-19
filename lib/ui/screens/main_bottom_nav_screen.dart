import 'package:flutter/material.dart';
import 'package:project/ui/screens/canceled_tasks_screen.dart';
import 'package:project/ui/screens/completed_tasks_screen.dart';
import 'package:project/ui/screens/new_tasks_screen.dart';
import 'package:project/ui/screens/progress_tasks_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    NewTasksScreen(),
    ProgressTasksScreen(),
    CompletedTasksScreen(),
    CanceledTaskScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add New"),
          BottomNavigationBarItem(
              icon: Icon(Icons.power), label: "In Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "Completed"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Cancel"),
        ],
      ),
    );
  }
}
