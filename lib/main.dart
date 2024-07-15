import 'package:flutter/material.dart';

import 'app/core/app_theme.dart';
import 'app/home/home_screen.dart';

void main() {
  runApp(const Todo());
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}
