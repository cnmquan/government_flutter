import 'package:flutter/material.dart';

import '../../web.dart';

class UserWidget extends StatelessWidget {
  final String imagePath;
  final String fullName;
  const UserWidget({
    Key? key,
    required this.fullName,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleImageWidget(
          size: 40,
          imagePath: imagePath,
          borderRadius: 12,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          fullName,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.exit_to_app_outlined,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
