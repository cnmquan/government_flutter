import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../utils/assets.dart';
import '../../../utils/translation.dart';
import '../../../widgets/mobile.dart';

@WidgetbookUseCase(name: 'Page', type: RequestPaperPage)
Widget requestPaperPage(BuildContext context) =>
    MaterialApp(home: RequestPaperPage());

class RequestPaperPage extends StatelessWidget {
  const RequestPaperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        title: TextPath.requestPaper,
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
            )
          ],
        ),
      ),
    );
  }
}
