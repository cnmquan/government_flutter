import 'package:flutter/material.dart';

import '../../../utils/assets.dart';
import '../../../widgets/mobile.dart';
import '../../../utils/translation.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotifyMessageWidget(
        animatedPath: JsonAssetPath.notFound,
        title: TextPath.notFoundTitle,
        message: TextPath.notFoundMessage,
      ),
    );
  }
}
