import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/utils/routing.dart';
import 'package:goverment_flutter_system/widgets/web.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../utils/assets.dart';

@WidgetbookUseCase(name: 'Page', type: ForgetPasswordPage)
Widget forgetPasswordPage(BuildContext context) =>
    MaterialApp(home: ForgetPasswordPage());

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  String? idNumber;
  String? email;
  String? errorIdNumber;
  String? errorEmail;
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
                      r'Quên mật khẩu',
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
                    label: r'Email nhân viên',
                    onChange: (value) {
                      email = value;
                    },
                    isPassword: false,
                    error: errorEmail,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomButtonWidget(
                    title: r'Gửi yêu cầu',
                    thumbnail: Colors.blue,
                    width: size.width * 0.4,
                    height: 48,
                    onPress: () {
                      if (idNumber == null || idNumber!.length != 12) {
                        errorIdNumber = r'Mã nhân viên không đúng định dạng';
                      } else {
                        errorIdNumber = null;
                      }
                      if (email == null) {
                        errorEmail = r'Email không đúng định dạng';
                      } else {
                        errorEmail = null;
                      }

                      setState(() {});
                      if (errorEmail != null || errorIdNumber != null) {
                        return;
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutingWebPath.signIn,
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomButtonWidget(
                    title: r'Đăng nhập',
                    thumbnail: Colors.green,
                    width: size.width * 0.4,
                    height: 48,
                    onPress: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutingWebPath.signIn,
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
