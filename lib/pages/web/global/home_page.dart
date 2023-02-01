import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../utils/assets.dart';
import '../../../utils/routing.dart';
import '../../../utils/translation.dart';
import '../../../widgets/web.dart';

@WidgetbookUseCase(name: 'Page', type: HomePage)
Widget homePage(BuildContext context) => MaterialApp(home: HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateWidget(
      isSignIn: true,
      isBackOn: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Wrap(
          spacing: 24,
          runSpacing: 24,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            ImageBoxTextWidget(
              imagePath: ImageAssetPath.searchInformation,
              title: TextPath.searchInformation,
              onTap: () {
                Navigator.of(context).pushNamed(
                  RoutingWebPath.searchInformation,
                );
              },
              size: 240,
            ),
            ImageBoxTextWidget(
              imagePath: ImageAssetPath.statisticPeople,
              title: TextPath.statisticPeople,
              onTap: () {
                Navigator.of(context).pushNamed(
                  RoutingWebPath.statisticPeople,
                );
              },
              size: 240,
            ),
            ImageBoxTextWidget(
              imagePath: ImageAssetPath.manageEmployees,
              title: TextPath.manageEmployees,
              onTap: () {
                Navigator.of(context).pushNamed(
                  RoutingWebPath.manageEmployees,
                );
              },
              size: 240,
            ),
            ImageBoxTextWidget(
              imagePath: ImageAssetPath.acceptRequest,
              title: TextPath.acceptRequest,
              onTap: () {
                Navigator.of(context).pushNamed(
                  RoutingWebPath.acceptRequest,
                );
              },
              size: 240,
            ),
            ImageBoxTextWidget(
              imagePath: ImageAssetPath.statisticReport,
              title: TextPath.statisticReport,
              onTap: () {
                Navigator.of(context).pushNamed(
                  RoutingWebPath.statisticReport,
                );
              },
              size: 240,
            ),
          ],
        ),
      ),
    );
  }
}
