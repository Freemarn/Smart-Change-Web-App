import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  set user(value) {
    _user = value;
    notifyListeners();
  }
}
