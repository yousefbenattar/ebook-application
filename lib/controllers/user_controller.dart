import '../data.dart';
import '../models/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user.dart';

Future<ApiResponse> register(String name, String email, String password) async {
  ApiResponse apiresponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(registerURL), headers: {
      "Accept": "application/json"
    }, body: {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password
    });
    switch (response.statusCode) {
      case 200:
        apiresponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiresponse.error = errors[errors.key.elementAt(0)[0]];
        break;
      default:
        apiresponse.error = somethingWentWrong;
    }
  } catch (e) {
    apiresponse.error = serverError;
  }
  return apiresponse;
}

Future<ApiResponse> login(String email, String password) async {
  ApiResponse apiresponse = ApiResponse();
  try{
    final response = await http.post(Uri.parse(loginURL),
    headers: {"Accept" : "application/json"},
    body: {"email" : email,"password":password});
    switch(response.statusCode){
      case 200:
      apiresponse.data = User.fromJson(jsonDecode(response.body));
      break;
      case 422:
      final errors = jsonDecode(response.body)['erros'];
      apiresponse.error = errors[errors.key.elementAt(0)[0]];
      break;
      case 403:
      apiresponse.error =jsonDecode(response.body)['message'];
      default:
      apiresponse.error = somethingWentWrong;
    } 
  }
  catch(e){
    apiresponse.error = serverError;
  }
  return apiresponse;
}
