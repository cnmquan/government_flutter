import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Short title', type: ImageBoxTextWidget)
Widget shortTitleImageBoxTextWidget(BuildContext context) {
  return ImageBoxTextWidget(
    imagePath:
        'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80',
    title: 'Short title',
    size: 240,
  );
}

@WidgetbookUseCase(name: 'Long title', type: ImageBoxTextWidget)
Widget longTitleImageBoxTextWidget(BuildContext context) {
  return ImageBoxTextWidget(
    imagePath:
        'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80',
    title: 'This title is very very very long',
    size: 240,
  );
}

@WidgetbookUseCase(name: 'Small size', type: ImageBoxTextWidget)
Widget smallSizeImageBoxTextWidget(BuildContext context) {
  return ImageBoxTextWidget(
    imagePath:
        'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80',
    title: 'Title goes here',
    size: 100,
  );
}

@WidgetbookUseCase(name: 'Medium size', type: ImageBoxTextWidget)
Widget mediumSizeImageBoxTextWidget(BuildContext context) {
  return ImageBoxTextWidget(
    imagePath:
        'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80',
    title: 'Title goes here',
    size: 240,
  );
}

@WidgetbookUseCase(name: 'Large size', type: ImageBoxTextWidget)
Widget largeSizeImageBoxTextWidget(BuildContext context) {
  return ImageBoxTextWidget(
    imagePath:
        'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80',
    title: 'Title goes here',
    size: 500,
  );
}

class ImageBoxTextWidget extends StatelessWidget {
  final double size;
  final String imagePath;
  final String title;
  final VoidCallback? onTap;
  const ImageBoxTextWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    this.size = 120,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isNetworkImage = imagePath.contains('http') ? true : false;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isNetworkImage) ...[
              CachedNetworkImage(
                imageUrl: imagePath,
                imageBuilder: (context, imageProvider) => Container(
                  width: size * 0.64,
                  height: size * 0.64,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.fitHeight,
              ),
            ] else ...[
              Image.asset(
                imagePath,
                width: size * 0.64,
                height: size * 0.64,
              )
            ],
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
