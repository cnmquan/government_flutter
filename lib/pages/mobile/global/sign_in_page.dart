import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/logic/auth_controller.dart';
import 'package:goverment_flutter_system/utils/assets.dart';

import '../../../utils/routing.dart';
import '../../../widgets/mobile.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? phoneNumber;
  String? password;
  String? errorPhoneNumber;
  String? errorPassword;
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
                  r'Chào mừng bạn đến với chúng tôi',
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
              AuthTextFieldWidget(
                label: r'Mật khẩu',
                onChange: (value) {
                  password = value;
                },
                isPassword: true,
                error: errorPassword,
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutingMobilePath.forgetPassword,
                  );
                },
                child: const SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      r'Quên mật khẩu',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.green,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              CustomButtonWidget(
                title: r'Đăng nhập',
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
                  if (password == null || password!.length < 4) {
                    errorPassword = r'Mật khẩu không đươc nhỏ hơn 4 ký tự';
                  } else {
                    errorPassword = null;
                  }

                  setState(() {});
                  if (errorPassword != null || errorPhoneNumber != null) {
                    return;
                  } else {
                    AuthController()
                        .signInResident(
                            phoneNumber: phoneNumber!, password: password!)
                        .then((value) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          RoutingMobilePath.home, (route) => false);
                    });
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              CustomButtonWidget(
                title: r'Đăng ký',
                thumbnail: Colors.orange,
                width: 200,
                height: 48,
                onPress: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutingMobilePath.signUp,
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
