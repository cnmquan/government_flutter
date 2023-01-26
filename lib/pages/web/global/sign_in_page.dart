import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/utils/routing.dart';
import 'package:goverment_flutter_system/widgets/web.dart';

import '../../../utils/assets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? idNumber;
  String? password;
  String? errorIdNumber;
  String? errorPassword;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fontSize = size.width / 1080 > size.height / 540
        ? size.width / 1080 * 16
        : size.height / 540 * 16;
    return TemplateWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.width > 540 ? 36 : 12),
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SizedBox(
              width: size.width < 540 ? double.maxFinite : 540,
              child: Center(
                child: Image.asset(
                  ImageAssetPath.government,
                  width: size.width * 0.48,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              width: size.width < 540 ? double.maxFinite : 540,
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      r'Đăng nhập',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: fontSize,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AuthTextFieldWidget(
                    fontSize: fontSize,
                    label: r'Mã nhân viên',
                    hint: r'0123456789',
                    onChange: (value) {
                      idNumber = value;
                    },
                    isPhoneNumber: false,
                    error: errorIdNumber,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AuthTextFieldWidget(
                    fontSize: fontSize,
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
                  CustomButtonWidget(
                    title: r'Đăng nhập',
                    thumbnail: Colors.blue,
                    width: size.width * 0.4,
                    height: 48,
                    onPress: () {
                      if (idNumber == null || idNumber!.length != 12) {
                        errorIdNumber = r'Mã nhân viên không đúng định dạng';
                      } else {
                        errorIdNumber = null;
                      }
                      if (password == null || password!.length < 4) {
                        errorPassword = r'Mật khẩu không đươc nhỏ hơn 4 ký tự';
                      } else {
                        errorPassword = null;
                      }

                      setState(() {});
                      if (errorPassword != null || errorIdNumber != null) {
                        return;
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutingWebPath.home,
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomButtonWidget(
                    title: r'Quên mật khẩu',
                    thumbnail: Colors.orange,
                    width: size.width * 0.4,
                    height: 48,
                    onPress: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutingWebPath.forgetPassword,
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
