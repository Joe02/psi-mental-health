import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:mental_health_poc/colors/colors.dart';
import 'package:mental_health_poc/components/DefaultButton.dart';
import 'package:mental_health_poc/components/FormField.dart';
import 'package:mental_health_poc/on_boarding_page/OnBoardingPage.dart';
import 'package:mental_health_poc/register_screen/RegisterScreen.dart';
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
    return Scaffold(
      appBar: buildLoginAppBar(),
      backgroundColor: loginBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: CustomFormField(
                    'Email',
                    "Text",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: CustomFormField(
                    'Senha',
                    "Password",
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: InkResponse(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Esqueceu sua senha?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: DefaultButton(
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 3.5,
                        vertical: 10.0,
                      ),
                      child: const Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Não tem uma conta?",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      InkResponse(
                        onTap: () {
                          Get.to(
                            RegisterScreen(),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            "Crie uma agora",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 36.0,
                    right: 20.0,
                    left: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.black38,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          "OU",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 2.0,
                  ),
                  child: SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SignInButton(
                    Buttons.AppleDark,
                    text: "Sign up with Google",
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SignInButton(
                    Buttons.FacebookNew,
                    text: "Sign up with Google",
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildLoginAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 10),
        child: InkResponse(
          onTap: () {
            Get.to(
              OnBoardingPage(),
            );
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
      ),
      title: const Padding(
        padding: EdgeInsets.only(
          top: 25.0,
        ),
        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }
}
