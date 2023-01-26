import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/utils/assets.dart';

import '../../../utils/routing.dart';
import '../../../widgets/mobile.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? phoneNumber;
  String? password;
  String? reTypePassword;
  String? errorPhoneNumber;
  String? errorPassword;
  String? errorReTypePassword;
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
                  r'Đăng ký',
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
                height: 12,
              ),
              AuthTextFieldWidget(
                label: r'Nhập lại mật khẩu',
                onChange: (value) {
                  reTypePassword = value;
                },
                isPassword: true,
                error: errorReTypePassword,
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
                title: r'Đăng ký',
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

                  if (reTypePassword == null || reTypePassword != password) {
                    errorReTypePassword =
                        r'Vui lòng nhập lại đúng mật khẩu đã nhập ở trên';
                  } else {
                    errorReTypePassword = null;
                  }

                  setState(() {});
                  if (errorPassword != null ||
                      errorPhoneNumber != null ||
                      errorReTypePassword != null) {
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
