import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../utils/assets.dart';
import '../../../widgets/mobile.dart';
import '../../../utils/translation.dart';

@WidgetbookUseCase(name: 'Page', type: NotFoundPage)
Widget notFoundPageGlobal(BuildContext context) =>
    MaterialApp(home: NotFoundPage());

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
