import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_poc/colors/colors.dart';

class DefaultButton extends StatefulWidget {
  Widget buttonChild;
  Null Function() buttonAction;

  DefaultButton(this.buttonChild, this.buttonAction, {Key? key})
      : super(key: key);

  @override
  DefaultButtonState createState() => DefaultButtonState();
}

class DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: defaultButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            18.0,
          ),
        ),
      ),
      onPressed: widget.buttonAction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: widget.buttonChild,
      ),
    );
  }
}
