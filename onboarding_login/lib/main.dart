import 'package:flutter/material.dart';
import 'package:onboarding_login/feature/login/view/login_view.dart';
import 'package:onboarding_login/feature/onboard/view/onboard_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: OnboardView.routeName,
      routes: {
        LoginView.routeName: (context) => const LoginView(),
        OnboardView.routeName: (context) => const OnboardView(),
      },
    );
  }
}
