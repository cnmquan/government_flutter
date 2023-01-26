import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../mobile.dart';

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
