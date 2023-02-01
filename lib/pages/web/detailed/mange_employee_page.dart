import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../utils/assets.dart';
import '../../../utils/translation.dart';
import '../../../widgets/web.dart';

@WidgetbookUseCase(name: 'Page', type: ManageEmployeePage)
Widget manageEmployeePage(BuildContext context) =>
    MaterialApp(home: ManageEmployeePage());

class ManageEmployeePage extends StatelessWidget {
  const ManageEmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TemplateWidget(
      isSignIn: true,
      isBackOn: false,
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
