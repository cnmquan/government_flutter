import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/widgets/web.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../utils/assets.dart';
import '../../../utils/translation.dart';

@WidgetbookUseCase(name: 'Page', type: NotFoundPage)
Widget notFoundPage(BuildContext context) => MaterialApp(home: NotFoundPage());

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TemplateWidget(
      isBackOn: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: NotifyMessageWidget(
          width: size.width * 0.4,
          height: 240,
          fontSize: 32,
          animatedPath: JsonAssetPath.notFound,
          title: TextPath.notFoundTitle,
          message: TextPath.notFoundMessage,
        ),
      ),
    );
  }
}
