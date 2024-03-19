import 'package:asmr_application/auth/login.dart';
import 'package:asmr_application/data.dart';
import 'package:asmr_application/models/api_response.dart';
import 'package:flutter/material.dart';

import '../controllers/user_controller.dart';
import '../screens/home.dart';
import 'register.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});
  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {
  void loadinfo() async {
    String token = await getToken();
    if (token == "") {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) =>const Login()), (route) => false);
    }
    else{
      ApiResponse apiResponse = await getUsers();
      if(apiResponse.error==null){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (builder)=>const Home()), (route) => false);
      }
      else if(apiResponse.error == unauthorized){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Register()), (route) => false);
      }
    }
  }
  @override
  void initState() {
    loadinfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
