// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jkssbping/config/api_configuration.dart';
import 'package:jkssbping/datacontroller/apiresponse.dart';
import 'package:jkssbping/model/authmodels/login_user.dart';
import 'package:jkssbping/model/authmodels/register_user.dart';
import 'package:logger/logger.dart';

class ApiServices {
  var log = Logger();

  //?Service Function for Registration
  //*=================================
    static Future<ApiResponse<Map<String, dynamic>>> createUser(RegisterUser obj) async {
    final headers = {
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(ApiConfig.kRegisterNewUser);
      final jsonData = jsonEncode({"username": obj.username,"email" : obj.email,"password" : obj.password});
      final response = await http.post(url, headers: headers, body: jsonData);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final Map<String, dynamic> data = jsonData;
        print(data);
        return ApiResponse(
            isSuccessful: true, data: data, responseCode: response.statusCode);
      } else {
        return ApiResponse(
            isSuccessful: false,
            data: null,
            message:
                "Invalid Response received from Server! Please try again in a minute or two",
            responseCode: response.statusCode);
      }
    } on SocketException {
      return ApiResponse(
        isSuccessful: false,
        data: null,
        message:
            "Unable to reach internet! Please try again in a minute or two",
      );
    } on FormatException {
      return ApiResponse(
        isSuccessful: false,
        data: null,
        message:
            "Invalid Response received from Server! Please try again in a minute or two",
      );
    } catch (e) {
      return ApiResponse(
        isSuccessful: false,
        data: null,
        message:
            "Invalid Response received from Server! Please try again in a minute or two",
      );
    }
  }
  //?Service function for Login
  //*==========================
  static Future<ApiResponse<Map<String, dynamic>>> loginUser(
      LoginUser obj) async {
    final headers = {
      "Content-Type": "application/json",
    };
    try {
      var url = Uri.parse(ApiConfig.kLoginUser);
      var jsonData = jsonEncode(LoginUser.fromJson(
          {"identifier": obj.identifier, "password": obj.password}));
      var response = await http.post(url, headers: headers, body: jsonData);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final Map<String, dynamic> data = jsonData;
        print(data);
        return ApiResponse(
            isSuccessful: true, data: data, responseCode: response.statusCode);
      } else {
        return ApiResponse(
            isSuccessful: false,
            data: null,
            message:
                "Invalid Response received from Server! Please try again in a minute or two",
            responseCode: response.statusCode);
      }
    } on SocketException {
      return ApiResponse(
        isSuccessful: false,
        data: null,
        message:
            "Unable to reach internet! Please try again in a minute or two",
      );
    } on FormatException {
      return ApiResponse(
        isSuccessful: false,
        data: null,
        message:
            "Invalid Response received from Server! Please try again in a minute or two",
      );
    } catch (e) {
      return ApiResponse(
        isSuccessful: false,
        data: null,
        message:
            "Invalid Response received from Server! Please try again in a minute or two",
      );
    }
  }
}