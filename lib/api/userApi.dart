import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserApi {
  static const String baseUrl =
      'http://192.168.175.245:8000/api/product/product_list/?type=exchange';

  // Registration method
  static Future<Map<String, dynamic>> registerUser(
      String email, String password) async {
    final url = Uri.parse('$baseUrl/register/');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        return {'error': 'Failed to register: ${response.body}'};
      }
    } catch (e) {
      return {'error': 'An error occurred: $e'};
    }
  }

  // Login method
  static Future<Map<String, dynamic>> loginUser(
      String email, String password) async {
    final url = Uri.parse('$baseUrl/login/');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {'error': 'Failed to login: ${response.body}'};
      }
    } catch (e) {
      return {'error': 'An error occurred: $e'};
    }
  }

  // OTP Verification method
  static Future<Map<String, dynamic>> verifyOTP(
      String email, String otp) async {
    final url = Uri.parse('$baseUrl/verify/');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'otp': otp,
        }),
      );

      if (response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        return {'error': 'Failed to verify OTP: ${response.body}'};
      }
    } catch (e) {
      return {'error': 'An error occurred: $e'};
    }
  }
}
