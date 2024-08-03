import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/auth/register.dart';
import 'package:todo_app/app/providers/task_proivder.dart';

import 'app/auth/login.dart';
import 'app/core/app_theme.dart';
import 'app/home/home_screen.dart';
import 'app/providers/auth_manager_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAiBXd3T0vw-Gx8At1UfDXIkHGW7XXsuv0',
      appId: '1:1057384319935:android:8f1cc2a7b2b97ac524ef0a',
      messagingSenderId: '1057384319935',
      projectId: 'todo-app-a0665',
      storageBucket: 'todo-app-a0665.appspot.com',
    ),
  );
  // await FirebaseDatabase.instance.setPersistenceEnabled(true);
  // await FirebaseFirestore.instance.disableNetwork();
  // FirebaseFirestore.instance.settings =
  //     const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => AuthManagerProvider()),
      ],
      child: const Todo(),
    ),
  );
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RegisterScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
      },
      theme: AppTheme.lightTheme,
    );
  }
}
