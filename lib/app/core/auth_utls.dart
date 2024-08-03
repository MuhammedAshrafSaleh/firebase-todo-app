import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app/core/firebase_utls.dart';
import 'package:todo_app/app/models/app_user.dart';
import 'package:provider/provider.dart';

import '../home/home_screen.dart';
import '../providers/auth_manager_provider.dart';
import '../widgets/custom_dialog_widget.dart';

class AuthManager {
  static Future<void> createUser(
      {required email,
      required password,
      required name,
      required context}) async {
    try {

      // When Click on Sign Up
      // 1. Show Loading Loading Dialog
      // 2. Create User With Th FirebaseAuth
      // 3. 
      DialogUtls.showLoading(context: context, message: 'Loading...');
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseManager.addUserToFireStore(
          AppUser(id: credential.user!.uid, name: name, email: email));
      DialogUtls.hideLoading(context: context);
      DialogUtls.showMessage(
          context: context, message: 'Registerd Successfully');
      print("============================");
      print(credential.user?.uid ?? 'Null Id');
      print("============================");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogUtls.hideLoading(context: context);
        DialogUtls.showMessage(
            title: 'Error!!',
            context: context,
            message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        DialogUtls.hideLoading(context: context);
        DialogUtls.showMessage(
            title: 'Error!!',
            context: context,
            message: 'The account already exists for that email.');
      }
      print(e);
    } catch (e) {
      DialogUtls.hideLoading(context: context);
      DialogUtls.showMessage(
          title: 'Error!!', context: context, message: e.toString());
      print("============================");
      print(e);
      print("============================");
    }
  }

  static Future<void> login({
    required email,
    required password,
    required context,
  }) async {
    try {
      DialogUtls.showLoading(context: context, message: 'Loading...');
      // await Future.delayed(const Duration(seconds: 2));
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var user = await FirebaseManager.getUser(credential.user?.uid ?? '');
      if (user == null) {
        return;
      }
      var authProvider = Provider.of<AuthManagerProvider>(context,
          listen: false); // User This Provider One Time only
      authProvider.updateUser(user);
      DialogUtls.hideLoading(context: context);
      DialogUtls.showMessage(context: context, message: 'Login Successfully');
      Navigator.pushNamed(context, HomeScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DialogUtls.hideLoading(context: context);
        DialogUtls.showMessage(
            title: 'Error!!',
            context: context,
            message: 'No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        DialogUtls.hideLoading(context: context);
        DialogUtls.showMessage(
            title: 'Error!!',
            context: context,
            message: 'Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      } else {
        DialogUtls.hideLoading(context: context);
        DialogUtls.showMessage(
            title: 'Error!!', context: context, message: e.code);
      }
    } catch (e) {
      DialogUtls.hideLoading(context: context);
      DialogUtls.showMessage(
        context: context,
        message: e.toString(),
        title: 'Error!!',
      );
    }
  }
}
