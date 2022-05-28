import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  bool _isProcessing = true;
  Map<String,dynamic> _loginResponse = {};
  int _responseCode = 0;
  String _message = "";

  bool get getIsProcessing => _isProcessing;
  
  setIsProcessing(bool value){
    _isProcessing = value;
    notifyListeners();
  }

  int get getResponseCode => _responseCode;

  setResponseCode(int code){
    _responseCode = code;
    notifyListeners();
  }

  String get getMessage => _message;

  setMessage(String msg){
    _message = msg;
    notifyListeners();
  }

  Map<String,dynamic> get getLoginResponse => _loginResponse;

  setLoginResponse(Map<String,dynamic> res){
    _loginResponse = res;
    notifyListeners();
  }
}