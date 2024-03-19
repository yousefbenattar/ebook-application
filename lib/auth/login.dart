import 'package:asmr_application/auth/register.dart';
import 'package:asmr_application/controllers/user_controller.dart';
import 'package:asmr_application/data.dart';
import 'package:asmr_application/models/api_response.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../screens/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loading = false;
  GlobalKey<FormState> _key = GlobalKey();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  void saveandgohome (User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("token",user.token ?? "");
    await pref.setInt("id", user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder)=>const Home()), (route) => false);
  }

  void _loginUser() async {
    ApiResponse response = await login(_emailcontroller.text, _passwordcontroller.text);
    if(response.error == null){
      saveandgohome(response.data as User);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (conext)=>const Home()), (route) => false);
    }
    else{
      setState(() {
        _loading =!_loading;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.error.toString())));
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Login Screen'),),
      body: SafeArea(child: Form(
        key: _key,
        child: ListView(
        padding:const EdgeInsets.all(10),
        children: [
          TextFormField(
            controller: _emailcontroller,
            validator: (value) => value!.isEmpty ? "Email is empty" :null,
            decoration: inputdecoration('Email'),
          ),
          mediumbox,
          TextFormField(
            controller: _passwordcontroller,
            validator: (value)=>value!.length < 5 ? "password to short" : null,
            decoration: inputdecoration('password'),
          ),
          mediumbox,
          _loading ? const Center(child: CircularProgressIndicator()):
          textButton('Login', (){
            setState(() {
              _loading=!_loading;
              _loginUser();
            });
          }),
          mediumbox,
          textdata('Dont have an account ?', 'Sign Up', (){
           Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const Register()),
                    (route) => false);
          })
        ],),)),
    );
  }
}