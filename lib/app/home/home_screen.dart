import 'package:flutter/material.dart';
import 'package:todo_app/app/core/app_theme.dart';
import 'package:todo_app/app/home/settings/settings_tab.dart';
import 'package:todo_app/app/home/task_list/task_list_tab.dart';

import 'task_list/add_task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        title: Text(
          'To-Do List',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: currentIndex == 0 ? TaskListTab() : Settings(),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.11,
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 12,
            child: SizedBox(
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'Task List',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskBottomSheet();
        },
        child: Icon(Icons.add, size: 35, color: AppTheme.whiteColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const AddTaskBottomSheet();
        });
  }
}
