import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color background =  Color(0xFFfafafc);
const Color sliverBackground = Color(0xFFfafafc);
const Color menu1Color = Color(0xFFF9d263);
const Color menu2Color = Color(0xFFf2683d);
const Color menu3Color = Color(0xFF84abe6);
const Color tabVarViewColor = Color(0xFFfdfdfd);
const Color starColor = Color(0xFFfdc746);
const Color subTitleText = Color(0xFFc5c4ca);
const Color loveColor = Color(0xFF88ace6);
const Color audioBlueBackground = Color(0xFFeeeffa);
const Color audioGreyBackground = Color(0xFFf2f2f2);

const baseURL = 'http://192.168.1.2/api';
const loginURL = '$baseURL/login';
const registerURL = '$baseURL/register';
const logoutURL = '$baseURL/logout';
const updatepost = '$baseURL/update';

const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';

Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? "";
}
Future<int> getId()async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('token') ?? 0;
}
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}