import 'package:flutter/material.dart';

import '../../../utils/assets.dart';
import '../../../utils/translation.dart';
import '../../../widgets/web.dart';

class AcceptRequestPage extends StatelessWidget {
  const AcceptRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TemplateWidget(
      isSignIn: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: NotifyMessageWidget(
          width: size.width * 0.4,
          height: 240,
          fontSize: 24,
          animatedPath: JsonAssetPath.comingSoon,
          title: TextPath.upComingTitle,
          message: TextPath.upComingMessage,
        ),
      ),
    );
  }
}
