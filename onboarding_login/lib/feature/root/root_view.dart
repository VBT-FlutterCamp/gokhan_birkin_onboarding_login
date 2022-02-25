import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:onboarding_login/feature/home/view/home_view.dart';
import 'package:onboarding_login/feature/httpService/view/comments_view.dart';

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);
  static const String routeName = '/rootview';

  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: getBottomNavigationBar(context),
    );
  }

  Widget _getBody() {
    return IndexedStack(
      index: selectedIndex,
      children: [
        HomeView(),
        CommentsView(),
        Container(),
      ],
    );
  }

  Widget getBottomNavigationBar(BuildContext context) {
    return Container(
      height: context.height * 0.05,
      width: context.width,
      decoration: BoxDecoration(
        //borderRadius: context.lowBorderRadius,
        color: Colors.grey.shade600,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                selectedIndex = 0;
              });
            },
            icon: Icon(
              Icons.home,
              color: selectedIndex == 0 ? Colors.white : Colors.grey.shade400,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                selectedIndex = 1;
              });
            },
            icon: Icon(
              Icons.chat_bubble,
              color: selectedIndex == 1 ? Colors.white : Colors.grey.shade400,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                selectedIndex = 2;
              });
            },
            icon: Icon(
              Icons.settings,
              color: selectedIndex == 2 ? Colors.white : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
