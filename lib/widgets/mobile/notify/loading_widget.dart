import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../utils/assets.dart';

@WidgetbookUseCase(name: 'Loading', type: LoadingWidget)
Widget loadingWidget(BuildContext context) => LoadingWidget();

class LoadingWidget extends StatelessWidget {
  final double size;
  const LoadingWidget({
    Key? key,
    this.size = 240,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 8,
        ),
        Lottie.asset(
          JsonAssetPath.loading,
          width: size,
          height: size * 2 / 3,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
