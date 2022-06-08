import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_poc/colors/colors.dart';

class CustomFormField extends StatefulWidget {
  String formHint;
  String type;

  CustomFormField(this.formHint, this.type, {Key? key}) : super(key: key);

  @override
  FormFieldState createState() => FormFieldState();
}

class FormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: defaultTextFormFieldBackgroundColor,
        hintText: widget.formHint,
        contentPadding: const EdgeInsets.only(
          left: 14.0,
          bottom: 20.0,
          top: 20.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: defaultTextFormFieldBorderColor,
          ),
          borderRadius: BorderRadius.circular(
            7.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: defaultTextFormFieldBorderColor,
          ),
          borderRadius: BorderRadius.circular(
            7.5,
          ),
        ),
      ),
      obscureText: widget.type == "Password",
    );
  }
}
