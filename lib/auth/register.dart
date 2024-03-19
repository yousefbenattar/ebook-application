import 'package:asmr_application/controllers/user_controller.dart';
import 'package:asmr_application/models/api_response.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data.dart';
import '../models/user.dart';
import '../screens/home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _loading = false;
  GlobalKey<FormState> _key = GlobalKey();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _passwordconfirmationcontroller = TextEditingController();
  void saveandgohome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("key", user.token ?? "");
    await pref.setInt("key", user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (builder) => const Home()),
        (route) => false);
  }

  void registerUser() async {
    ApiResponse response = await register(
        _namecontroller.text, _emailcontroller.text, _passwordcontroller.text);
    if (response.error == null) {
      saveandgohome(response.data as User);
    } else {
      setState(() {
        _loading = !_loading;
      });
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.error.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Screen'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Form(
                key: _key,
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    TextFormField(
                      controller: _namecontroller,
                      validator: (value) =>
                          value!.isEmpty ? "Invalid Name" : null,
                      decoration: inputdecoration('Name'),
                    ),
                    mediumbox,
                    TextFormField(
                      controller: _emailcontroller,
                      validator: (value) =>
                          value!.isEmpty ? 'Invalid email' : null,
                      decoration: inputdecoration('email'),
                    ),
                    mediumbox,
                    TextFormField(
                      controller: _passwordcontroller,
                      validator: (value) => value!.length < 5
                          ? "Required at least 5 chars"
                          : null,
                      decoration: inputdecoration('password'),
                    ),
                    mediumbox,
                    TextFormField(
                      controller: _passwordconfirmationcontroller,
                      validator: (value) => value != _passwordcontroller.text
                          ? "password not matched"
                          : null,
                      decoration: inputdecoration('password confirmation'),
                    ),
                    mediumbox,
                    _loading ? const Center(child: CircularProgressIndicator()) : textButton('Register', () {
                    if(_key.currentState!.validate()){
                        setState(() {
                        _loading = !_loading;
                        registerUser();
                      });
                    }
                    }),
                    mediumbox,
                    textdata('Already Have an account ?', 'Log in', () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                          (route) => false);
                    })
                  ],
                ))));
  }
}
