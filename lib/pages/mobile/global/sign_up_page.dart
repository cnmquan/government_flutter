import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:goverment_flutter_system/logic/auth_controller.dart';
import 'package:goverment_flutter_system/utils/assets.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import '../../../utils/routing.dart';
import '../../../widgets/mobile.dart';

@WidgetbookUseCase(name: 'Page', type: SignUpPage)
Widget signUpPageGlobal(BuildContext context) =>
    MaterialApp(home: SignUpPage());

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;
  String? phoneNumber;
  String? password;
  String? reTypePassword;
  String? errorEmail;
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
                label: r'Email',
                hint: r'abc@gmail.com',
                onChange: (value) {
                  email = value;
                },
                isPhoneNumber: false,
                error: errorEmail,
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
              const SizedBox(
                height: 12,
              ),
              CustomButtonWidget(
                title: r'Đăng ký',
                thumbnail: Colors.blue,
                width: 200,
                height: 48,
                onPress: () async {
                  if (phoneNumber == null ||
                      phoneNumber!.length > 13 ||
                      phoneNumber!.length < 8) {
                    errorPhoneNumber = r'Số điện thoại không đúng định dạng';
                  } else {
                    errorPhoneNumber = null;
                  }
                  if (email == null) {
                    errorEmail = r'Email không đúng định dạng';
                  } else {
                    errorEmail = null;
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
                      errorReTypePassword != null ||
                      errorEmail != null) {
                    return;
                  } else {
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      _showLoadingDialog(context);
                    });
                    AuthController()
                        .signUpResident(
                      phoneNumber: phoneNumber!,
                      password: password!,
                      email: email!,
                    )
                        .then((Map<String, String?> response) {
                      if (response['error'] != null) {
                        Navigator.of(context).maybePop();
                        SchedulerBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          _showCustomDialog(context, response['error']!);
                        });
                      } else {
                        Navigator.of(context).maybePop();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            RoutingMobilePath.home, (route) => false);
                      }
                    });
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

  _showCustomDialog(BuildContext context, String message) async {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: NotifyMessageWidget(
              animatedPath: JsonAssetPath.failed,
              title: r'Báo lỗi',
              message: message,
            ),
          );
        }).then((value) => {Navigator.maybePop(context)});
  }

  _showLoadingDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const LoadingWidget(),
          );
        });
  }
}
