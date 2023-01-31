import 'package:flutter/material.dart';

import '../../../utils/assets.dart';
import '../../../utils/translation.dart';
import '../../../widgets/mobile.dart';

class FamilyInformationPage extends StatelessWidget {
  const FamilyInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        title: TextPath.familyInformation,
        canBackPage: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            NotifyMessageWidget(
              animatedPath: JsonAssetPath.comingSoon,
              title: TextPath.upComingTitle,
              message: TextPath.upComingMessage,
            ),
          ],
        ),
      ),
    );
  }
}
