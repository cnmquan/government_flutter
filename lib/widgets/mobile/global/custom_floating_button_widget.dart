import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'FloatingActionButton', type: FloatingActionButton)
CustomFloatingButtonWidget customFloatingActionButtonWidget(
    BuildContext context) {
  return CustomFloatingButtonWidget();
}

class CustomFloatingButtonWidget extends StatelessWidget {
  final bool isEditState;
  final VoidCallback? onPress;
  const CustomFloatingButtonWidget({
    Key? key,
    this.isEditState = false,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      backgroundColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          width: 1,
          color: Colors.black,
        ),
      ),
      child: Icon(
        isEditState ? Icons.cancel_outlined : Icons.edit,
        color: Colors.black,
      ),
    );
  }
}
