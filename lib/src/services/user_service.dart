// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class UserService {
  final Dio _dio = Dio();

  Future<Map<String, String>> fetchUserData(int userId) async {
    try {
      final response = await _dio.get('https://reqres.in/api/users/$userId');
      final data = response.data['data'];
      final name = '${data['first_name']} ${data['last_name']}';
      final avatarUrl = data['avatar'];
      return {'name': name, 'avatarUrl': avatarUrl};
    } catch (e) {
      print('Failed to load user data: $e');
      return {'name': '', 'avatarUrl': ''};
    }
  }
}
