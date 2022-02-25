import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:onboarding_login/feature/login/view/login_view.dart';
import 'package:onboarding_login/feature/widgets/custom_elevated_button.dart';
import 'package:onboarding_login/feature/widgets/custom_text_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);
  static const String routeName = '/signup';

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _emailText = "Email";
  final _passwordText = "Password";
  final _confirmPasswordText = "Confirm Password";
  final _nameText = "Name";

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
                Text('Register Page',
                    style: Theme.of(context).textTheme.headline4),
                SizedBox(
                  height: context.height * 0.1,
                ),
                CustomTextField(
                  controller: _emailController,
                  textInputType: TextInputType.emailAddress,
                  labelText: _emailText,
                  focusNode: _emailFocusNode,
                ),
                CustomTextField(
                    controller: _nameController,
                    textInputType: TextInputType.text,
                    labelText: _nameText,
                    focusNode: _nameFocusNode),
                CustomTextField(
                  controller: _passwordController,
                  textInputType: TextInputType.visiblePassword,
                  labelText: _passwordText,
                  focusNode: _passwordFocusNode,
                ),
                CustomTextField(
                  controller: _confirmPasswordController,
                  textInputType: TextInputType.visiblePassword,
                  labelText: _confirmPasswordText,
                  focusNode: _confirmPasswordFocusNode,
                ),
                CustomElevatedButton(
                  onPressed: () {},
                  text: 'text',
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginView()),
                    //   (route) => false,
                    // );
                    print('pressed');
                    Navigator.pushNamed(context, LoginView.routeName);
                  },
                  child: Text('Do you have an account? Sign in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
