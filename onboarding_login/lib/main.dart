import 'package:flutter/material.dart';
import 'package:onboarding_login/feature/home/view/home_view.dart';
import 'package:onboarding_login/feature/httpService/view/comments_view.dart';
import 'package:onboarding_login/feature/login/view/login_view.dart';
import 'package:onboarding_login/feature/onboard/view/onboard_view.dart';
import 'package:onboarding_login/feature/root/root_view.dart';
import 'package:onboarding_login/feature/signup/view/signup_view.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: RootView.routeName,
      routes: {
        OnboardView.routeName: (context) => const OnboardView(),
        LoginView.routeName: (context) => const LoginView(),
        SignUpView.routeName: (context) => const SignUpView(),
        HomeView.routeName: (context) => const HomeView(),
        CommentsView.routeName: (context) => const CommentsView(),
        RootView.routeName: (context) => const RootView(),
      },
    );
  }
}
