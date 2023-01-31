import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:goverment_flutter_system/utils/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/routing.dart';
import '../../../widgets/mobile.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? phoneNumber;
  String? errorPhoneNumber;
  String? errorMessage;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  Future<void> verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+84$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        setState(() {
          loading = false;
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          loading = false;
        });
        errorMessage = e.message;
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          loading = false;
        });
        Navigator.of(context).pushNamed(
          RoutingMobilePath.verifyCode,
          arguments: verificationId,
        );
      },
      timeout: const Duration(seconds: 20),
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          loading = false;
        });
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          _showCustomDialog(context);
        });
        debugPrint(verificationId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        _showLoadingDialog(context);
      });
    }
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
                hint: r'123456789',
                prefix: r'+84',
                onChange: (value) {
                  phoneNumber = value;
                },
                isPhoneNumber: true,
                error: errorPhoneNumber,
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomButtonWidget(
                title: r'Gửi mã OTP',
                thumbnail: Colors.blue,
                width: 200,
                height: 48,
                onPress: () {
                  if (phoneNumber == null) {
                    errorPhoneNumber = r'Số điện thoại không đúng định dạng';
                  } else {
                    errorPhoneNumber = null;
                  }
                  setState(() {});
                  if (errorPhoneNumber != null) {
                    return;
                  } else {
                    setState(() {
                      loading = true;
                    });
                    verifyPhone();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showCustomDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const NotifyMessageWidget(
              animatedPath: JsonAssetPath.failed,
              title: r'Báo lỗi',
              message:
                  r'Hiện tại hệ thống không thể gửi mã xác thực. Hi vọng bạn có thể chờ đợi và sử dụng sau.',
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
