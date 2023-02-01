import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../utils/assets.dart';
import '../../../utils/routing.dart';
import '../../../utils/translation.dart';
import '../../../widgets/mobile.dart';

@WidgetbookUseCase(name: 'Page', type: HomePage)
Widget homePageGlobal(BuildContext context) => MaterialApp(home: HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fullName = 'Nguyen Van A';
    String imagePath =
        'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80';
    return Scaffold(
      appBar: AppbarWidget(
        title: fullName,
        canBackPage: false,
        imagePath: imagePath,
      ),
      body: GridView.extent(
        primary: false,
        padding: const EdgeInsets.all(24),
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        maxCrossAxisExtent: 180,
        children: [
          ImageBoxTextWidget(
            imagePath: ImageAssetPath.idCard,
            title: TextPath.idCard,
            onTap: () => Navigator.pushNamed(
              context,
              RoutingMobilePath.idCard,
            ),
          ),
          ImageBoxTextWidget(
            imagePath: ImageAssetPath.birthCertification,
            title: TextPath.birthCertification,
            onTap: () => Navigator.pushNamed(
              context,
              RoutingMobilePath.birthCertification,
            ),
          ),
          ImageBoxTextWidget(
            imagePath: ImageAssetPath.registrationBook,
            title: TextPath.registrationBook,
            onTap: () => Navigator.pushNamed(
              context,
              RoutingMobilePath.registrationBook,
            ),
          ),
          ImageBoxTextWidget(
            imagePath: ImageAssetPath.requestPaper,
            title: TextPath.requestPaper,
            onTap: () => Navigator.pushNamed(
              context,
              RoutingMobilePath.requestPaper,
            ),
          ),
        ],
      ),
    );
  }
}
