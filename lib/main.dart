import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_poc/login_screen/LoginScreen.dart';
import 'package:mental_health_poc/on_boarding_page/OnBoardingPage.dart';
import 'package:mental_health_poc/splash_screen/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final Future<SharedPreferences> appPrefs = SharedPreferences.getInstance();
  bool? shouldGoToOnBoarding = false;

  @override
  void initState() {
    super.initState();
    appPrefs.then((value) =>
        shouldGoToOnBoarding = value.getBool('haventVisitedOnBoarding'));

    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => checkIfOnBoardingIsNeeded());
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }

  checkIfOnBoardingIsNeeded() async {
    await Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (value) => shouldGoToOnBoarding == null
          ? Get.offAll(
              OnBoardingPage(),
            )
          : Get.offAll(
              LoginScreen(),
            ),
    );
  }
}
