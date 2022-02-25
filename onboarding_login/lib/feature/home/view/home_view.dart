import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:onboarding_login/core/design/color.dart';
import 'package:onboarding_login/core/design/text_style.dart';
import 'package:onboarding_login/feature/home/models/home_models.dart';

part './parts/first_row.dart';
part './parts/second_row.dart';
part './parts/list_row.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = '/homeview';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBgColor,
      body: Container(
        padding: context.horizontalPaddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.dynamicHeight(0.1),
            ),
            keepUpText(context),
            SizedBox(
              height: context.dynamicHeight(0.01),
            ),
            subcritionRow(context),
            homeListView()
          ],
        ),
      ),
    );
  }

  Expanded homeListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: contents.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: context.lowValue),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: context.normalBorderRadius,
                color: Colors.white,
              ),
              child: ListTile(
                trailing: Container(
                  decoration: BoxDecoration(
                    color: homeDeleteBgColor,
                    borderRadius: context.lowBorderRadius,
                  ),
                  padding: EdgeInsets.only(bottom: context.lowValue),
                  child: const Icon(
                    Icons.delete,
                    color: homeDeleteColor,
                  ),
                ),
                title: Text(
                  contents[index].name,
                  style: bodyBoldStyle.copyWith(),
                ),
                subtitle: Text(
                  contents[index].url,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Row subcritionRow(BuildContext context) {
    return Row(
      children: [
        Text('Subscriptions(${contents.length})',
            style: bodyStyle.copyWith(color: kcWhite)),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: kcLimedSpruce,
            borderRadius: context.lowBorderRadius,
          ),
          padding: context.paddingLow,
          child: Text(
            '25% CLEANED',
            style: bodyBoldStyle.copyWith(color: kcWhite),
          ),
        ),
      ],
    );
  }

  SizedBox keepUpText(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.6),
      child: Text(
        'Keep up the carbon-free work!',
        style: headlineStyle.copyWith(color: kcWhite),
        textAlign: TextAlign.left,
      ),
    );
  }
}
