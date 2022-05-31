import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final Future<SharedPreferences> appPrefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();

    appPrefs.then(
      (value) => value.setBool(
        'haventVisitedOnBoarding',
        false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Login Screen yet to be implemented",
        ),
      ),
    );
  }
}
