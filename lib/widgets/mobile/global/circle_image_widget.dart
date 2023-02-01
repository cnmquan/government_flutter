import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Small', type: CircleImageWidget)
Widget smallCircleImageWidget(BuildContext context) {
  return CircleImageWidget(
    borderRadius: 12,
    size: 10,
    imagePath:
        'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80',
  );
}

@WidgetbookUseCase(name: 'Large', type: CircleImageWidget)
Widget largeCircleImageWidget(BuildContext context) {
  return CircleImageWidget(
    borderRadius: 12,
    size: 40,
    imagePath:
        'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80',
  );
}

class CircleImageWidget extends StatelessWidget {
  final double size;
  final double borderRadius;
  final double padding;
  final String imagePath;
  final VoidCallback? onTap;
  const CircleImageWidget({
    Key? key,
    required this.size,
    required this.borderRadius,
    required this.imagePath,
    this.padding = 8,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: CachedNetworkImage(
            imageUrl: imagePath,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              width: size,
              height: size,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(borderRadius),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
