import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/utils/routing.dart';

import '../../mobile.dart';

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
            Navigator.pushReplacementNamed(context, RoutingMobilePath.signIn);
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
