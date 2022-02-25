import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:onboarding_login/core/utils/supabase.dart';
import 'package:onboarding_login/feature/signup/view/signup_view.dart';
import 'package:onboarding_login/feature/widgets/custom_elevated_button.dart';
import 'package:onboarding_login/feature/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static const String routeName = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _emailText = "Email";
  final _passwordText = "Password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: context.height * 0.1,
                ),
                Text('Login Page',
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(
                  height: context.height * 0.1,
                ),
                CustomTextField(
                  controller: _emailController,
                  focusNode: _emailFocusNode,
                  labelText: _emailText,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                CustomTextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  labelText: _passwordText,
                  isPassword: true,
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: context.height * 0.1,
                ),
                CustomElevatedButton(
                  onPressed: () {},
                  text: 'Login',
                ),
                SizedBox(
                  height: context.height * 0.1,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpView.routeName);
                  },
                  child: Text('Don\'t have an account?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
