
import 'package:flutter/foundation.dart';
import 'package:todo_app/app/models/app_user.dart';

class AuthManagerProvider extends ChangeNotifier{
  AppUser? currentUser;

  void updateUser(AppUser? newUser){
    currentUser = newUser;
    notifyListeners();
  }
}