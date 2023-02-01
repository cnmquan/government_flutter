import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/utils/assets.dart';
import 'package:goverment_flutter_system/utils/translation/text_path.dart';
import 'package:lottie/lottie.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../mobile.dart';

@WidgetbookUseCase(name: 'Not found', type: NotifyMessageWidget)
Widget notFound(BuildContext context) {
  return NotifyMessageWidget(
    width: 500,
    height: 240,
    fontSize: 32,
    animatedPath: JsonAssetPath.notFound,
    title: TextPath.notFoundTitle,
    message: TextPath.notFoundMessage,
  );
}

@WidgetbookUseCase(name: 'Success', type: NotifyMessageWidget)
Widget success(BuildContext context) {
  return NotifyMessageWidget(
    width: 500,
    height: 240,
    fontSize: 24,
    animatedPath: JsonAssetPath.success,
    title: r'Thông báo',
    message: r'Chúng tôi đã ghi nhận góp ý của bạn và đang xử lý.',
  );
}

@WidgetbookUseCase(name: 'Coming soon', type: NotifyMessageWidget)
Widget comingSoon(BuildContext context) {
  return NotifyMessageWidget(
    width: 500,
    height: 240,
    fontSize: 24,
    animatedPath: JsonAssetPath.comingSoon,
    title: TextPath.upComingTitle,
    message: TextPath.upComingMessage,
  );
}

class NotifyMessageWidget extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onPress;
  final double width;
  final double height;
  final double fontSize;
  final String animatedPath;
  const NotifyMessageWidget({
    Key? key,
    required this.title,
    required this.message,
    required this.animatedPath,
    this.onPress,
    this.width = 240,
    this.height = 240,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: fontSize / 2,
        ),
        Lottie.asset(
          animatedPath,
          width: width,
          height: height,
          fit: BoxFit.contain,
          repeat: false,
        ),
        SizedBox(
          height: fontSize / 2,
        ),
        SizedBox(
          width: double.maxFinite,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: fontSize * 1.5,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: fontSize,
        ),
        SizedBox(
          width: double.maxFinite,
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: fontSize * 2,
        ),
        CustomButtonWidget(
          title: r'Quay lại',
          thumbnail: Colors.red,
          height: 60,
          width: width,
          padding: 12,
          onPress: () {
            onPress?.call();
            Navigator.maybePop(context);
          },
        ),
        SizedBox(
          height: fontSize,
        ),
      ],
    );
  }
}
