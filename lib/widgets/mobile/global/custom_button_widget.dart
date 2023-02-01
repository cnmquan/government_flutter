import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Short title', type: CustomButtonWidget)
Widget shortTitleCustomButtonWidget(BuildContext context) {
  return CustomButtonWidget(
    title: 'Short',
    thumbnail: Colors.blue,
    onPress: () {},
  );
}

@WidgetbookUseCase(name: 'Long title', type: CustomButtonWidget)
Widget longTitleCustomButtonWidget(BuildContext context) {
  return CustomButtonWidget(
    title: 'Long',
    thumbnail: Colors.blue,
    onPress: () {},
  );
}

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final Color thumbnail;
  final double? width, height;
  final double padding;
  final VoidCallback? onPress;
  const CustomButtonWidget({
    Key? key,
    required this.title,
    required this.thumbnail,
    this.width,
    this.height,
    this.onPress,
    this.padding = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPress,
        style: OutlinedButton.styleFrom(
            splashFactory: InkRipple.splashFactory,
            padding: EdgeInsets.all(padding),
            backgroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: thumbnail,
                width: 2,
              ),
            )),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: thumbnail,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
