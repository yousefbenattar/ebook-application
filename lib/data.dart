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
const userURL = '$baseURL/user';
const loginURL = '$baseURL/login';
const registerURL = '$baseURL/register';
const logoutURL = '$baseURL/logout';
const updatepost = '$baseURL/update';

const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';

SizedBox smallbox = const SizedBox(height: 10);
SizedBox mediumbox = const SizedBox(height: 20);

Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? "";
}
Future<int> getId() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getInt('token') ?? 0;
}
Future<bool> logout() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return await pref.remove('token');
}

InputDecoration inputdecoration (String label){
  return InputDecoration(
    contentPadding:const EdgeInsets.all(8),
    hintText: label,
    border:const OutlineInputBorder(
      borderSide: BorderSide(width: 5,color: Colors.black)
    )
  );
}

TextButton textButton (String label,Function onPressed){
  return TextButton(
    onPressed: () => onPressed(),
    style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) =>  Colors.blue),
    padding: MaterialStateProperty.resolveWith((states) =>const EdgeInsets.symmetric(vertical: 10,horizontal: 15))),
    child: Text(label,style:const TextStyle(color: Colors.white,fontSize: 25),),
  );
}

Row textdata (String label_1,String label_2,Function onPressed){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(label_1,style:const TextStyle(fontSize: 18),),
    const SizedBox(width:5),
    InkWell(onTap:() => onPressed() , child: Text(label_2,style:const TextStyle(fontSize: 18 , color: Colors.blue),)),
  ]);
}