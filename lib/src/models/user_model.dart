import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yes_no_app/src/services/user_service.dart';

class UserModel extends ChangeNotifier {
  String _name = '';
  String _avatarUrl = '';

  // 
  final int _userId = 1 + (10 * Random().nextDouble()).toInt();

  String get name => _name;
  String get avatarUrl => _avatarUrl;
  int get userId => _userId;

  final UserService _userService = UserService();

  Future<void> fetchUserData() async {
    final userData = await _userService.fetchUserData(_userId);
    _name = userData['name'] ?? '';
    _avatarUrl = userData['avatarUrl'] ?? '';
    notifyListeners();
  }
}
