import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);
  VoidCallback onPressed;
  String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.normalValue,
          vertical: context.lowValue,
        ),
        child: Text(text),
      ),
    );
  }
}
