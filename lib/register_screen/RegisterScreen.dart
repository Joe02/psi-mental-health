import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_poc/colors/colors.dart';
import 'package:mental_health_poc/components/DefaultButton.dart';
import 'package:mental_health_poc/components/FormField.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildRegisterAppBar(),
      backgroundColor: loginBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: CustomFormField(
                    'Nome completo',
                    "Text",
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: CustomFormField(
                    'Confirmar senha',
                    "Password",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: DefaultButton(
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 4.5,
                        vertical: 10.0,
                      ),
                      child: const Text(
                        "Criar Conta",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    () {
                      //TODO "Criar conta"
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(
                          4.0,
                        ),
                        child: Text(
                          "Já possui conta?",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                          4.0,
                        ),
                        child: Text(
                          "Fazer login",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildRegisterAppBar() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 10),
        child: InkResponse(
          onTap: () {
            Get.back();
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
          "Criar Conta",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    );
  }
}
