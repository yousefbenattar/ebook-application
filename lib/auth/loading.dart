import 'package:asmr_application/auth/login.dart';
import 'package:asmr_application/data.dart';
import 'package:flutter/material.dart';

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
          MaterialPageRoute(builder: (builder) => Login()), (route) => false);
    }
    else{}
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
