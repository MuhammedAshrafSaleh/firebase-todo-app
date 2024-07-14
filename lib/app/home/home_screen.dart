import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

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
    );
  }
}
