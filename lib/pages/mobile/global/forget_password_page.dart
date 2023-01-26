import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/utils/assets.dart';

import '../../../utils/routing.dart';
import '../../../widgets/mobile.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  String? phoneNumber;
  String? errorPhoneNumber;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 36,
              ),
              Image.asset(
                ImageAssetPath.government,
                width: 240,
                height: 240,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                width: double.maxFinite,
                child: Text(
                  r'Quên mật khẩu',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              AuthTextFieldWidget(
                label: r'Số điện thoại',
                hint: r'0123456789',
                onChange: (value) {
                  phoneNumber = value;
                },
                isPhoneNumber: true,
                error: errorPhoneNumber,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomButtonWidget(
                title: r'Xác nhận',
                thumbnail: Colors.blue,
                width: 200,
                height: 48,
                onPress: () {
                  if (phoneNumber == null ||
                      phoneNumber!.length > 13 ||
                      phoneNumber!.length < 8) {
                    errorPhoneNumber = r'Số điện thoại không đúng định dạng';
                  } else {
                    errorPhoneNumber = null;
                  }
                  setState(() {});
                  if (errorPhoneNumber != null) {
                    return;
                  } else {
                    Navigator.pushReplacementNamed(
                      context,
                      RoutingMobilePath.signIn,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              CustomButtonWidget(
                title: r'Đăng nhập',
                thumbnail: Colors.orange,
                width: 200,
                height: 48,
                onPress: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutingMobilePath.signIn,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
