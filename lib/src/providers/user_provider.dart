// ignore_for_file: avoid_print

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class UserProvider with ChangeNotifier {
  final int _randomNumber = 1 + (10 * Random().nextDouble()).toInt();
  String _name = '';
  String _avatarUrl = '';

  int get randomNumber => _randomNumber;
  String get name => _name;
  String get avatarUrl => _avatarUrl;

  UserProvider() {
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final response =
          await Dio().get('https://reqres.in/api/users/$_randomNumber');
      _name =
          '${response.data['data']['first_name']} ${response.data['data']['last_name']}';
      _avatarUrl = response.data['data']['avatar'];
      notifyListeners();
    } catch (e) {
      print('Failed to load user data: $e');
    }
  }
}
