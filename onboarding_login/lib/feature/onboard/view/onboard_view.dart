import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding_login/core/constants/strings/onboard_strings.dart';
import 'package:onboarding_login/feature/onboard/model/onboard_model.dart';
import 'package:kartal/kartal.dart';
import 'package:onboarding_login/feature/widgets/custom_elevated_button.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);
  static const String routeName = '/onboard';

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  PageController? _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: onboardingModel.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                _svgPicture(index, context),
                _dotsColumn(index, context),
                _customCard(index, context),
              ],
            );
          },
        ),
      ),
    );
  }

  Positioned _customCard(int index, BuildContext context) {
    return Positioned(
      top: context.height * 0.5,
      child: Container(
        height: context.height * 0.5,
        width: context.width,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(context.width * 0.1),
            topRight: Radius.circular(context.width * 0.1),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(context.height * 0.02),
              child: Text(onboardingModel[index].title,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: context.height * 0.05),
            Padding(
              padding: EdgeInsets.all(context.height * 0.05),
              child: Text(onboardingModel[index].description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(wordSpacing: 5, letterSpacing: 0.5, height: 2)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  text: OnBoardString.skip,
                ),
                SizedBox(width: context.width * 0.2),
                CustomElevatedButton(
                  onPressed: () {
                    if (index != onboardingModel.length - 1) {
                      _pageController?.nextPage(
                        duration: context.durationLow,
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.pushNamed(context, '/login');
                    }
                  },
                  text: index == onboardingModel.length - 1
                      ? OnBoardString.login
                      : OnBoardString.next,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _svgPicture(int index, BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade700,
      child: SvgPicture.asset(
        onboardingModel[index].image,
        alignment: Alignment.topCenter,
        width: context.height,
        height: context.height,
      ),
    );
  }

  SizedBox _dotsColumn(int index, BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Container(
        margin: EdgeInsets.only(
          top: context.highValue,
          left: context.normalValue,
          right: context.normalValue,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(onboardingModel.length, (indexDots) {
                    return Container(
                      margin: EdgeInsets.only(bottom: context.lowValue * 0.2),
                      width: context.lowValue,
                      height: index == indexDots
                          ? context.normalValue
                          : context.lowValue,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(context.lowValue),
                        color: index == indexDots
                            ? Colors.black
                            : Colors.black.withOpacity(0.3),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
