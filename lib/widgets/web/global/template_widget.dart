import 'package:flutter/material.dart';

import '../../web.dart';

class TemplateWidget extends StatelessWidget {
  final Widget child;
  final bool isSignIn;
  final bool isBackOn;
  const TemplateWidget({
    Key? key,
    required this.child,
    this.isSignIn = false,
    this.isBackOn = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fullName = 'Nguyen Van A';
    String imagePath =
        'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=466&q=80';
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (isSignIn) ...[
            UserWidget(
              fullName: fullName,
              imagePath: imagePath,
            ),
          ],
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06, vertical: size.height * 0.08),
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: child,
              ),
            ),
          ),
          if (isBackOn) ...[
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButtonWidget(
                title: r'Quay lại',
                thumbnail: Colors.red,
                width: 200,
                height: 48,
                onPress: () {
                  Navigator.maybePop(context);
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
