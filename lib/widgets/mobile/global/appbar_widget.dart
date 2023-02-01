import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/utils/routing.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../mobile.dart';

@WidgetbookUseCase(name: 'Long title', type: AppbarWidget)
Widget appbarLongTitle(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AppbarWidget(
      title: 'This title is very very long',
      imagePath:
          'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80',
    ),
  );
}

@WidgetbookUseCase(name: 'Short title', type: AppbarWidget)
Widget appbarShortTitle(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AppbarWidget(
      title: 'Title',
      imagePath:
          'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80',
    ),
  );
}

@WidgetbookUseCase(name: 'Can back page', type: AppbarWidget)
Widget appbarBackPage(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AppbarWidget(
      title: 'Title',
      canBackPage: true,
      imagePath:
          'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80',
    ),
  );
}

class AppbarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String? imagePath;
  final bool canBackPage;
  final VoidCallback? onTapImage;
  const AppbarWidget({
    Key? key,
    required this.title,
    this.canBackPage = false,
    this.imagePath,
    this.onTapImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: Border.all(color: Colors.black),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      leading: canBackPage
          ? IconButton(
              onPressed: () => Navigator.maybePop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.black,
              ),
            )
          : CircleImageWidget(
              imagePath: imagePath!,
              size: 32,
              borderRadius: 8,
            ),
      actions: [
        IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.pushReplacementNamed(context, RoutingMobilePath.signIn);
            });
          },
          icon: const Icon(
            Icons.exit_to_app_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
