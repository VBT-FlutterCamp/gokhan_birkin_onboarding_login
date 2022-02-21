import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String labelText;
  final bool? isPassword;
  final FocusNode focusNode;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.labelText,
    this.isPassword,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.normalValue),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: textInputType,
        obscureText: isPassword ?? false,
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
              borderRadius: context.normalBorderRadius,
              borderSide: BorderSide(color: context.appTheme.primaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: context.normalBorderRadius,
              borderSide: BorderSide(color: context.appTheme.primaryColor)),
        ),
      ),
    );
  }
}
