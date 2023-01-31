import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:goverment_flutter_system/utils/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/routing.dart';
import '../../../widgets/mobile.dart';

class VerifyCodePage extends StatefulWidget {
  final String? verificationId;
  const VerifyCodePage({
    Key? key,
    this.verificationId,
  }) : super(key: key);

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  String? smsCode;
  String? errorSmsCode;
  String? errorMessage;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

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
                label: r'Nhập mã xác thực',
                hint: r'6 chữ số',
                onChange: (value) {
                  smsCode = value;
                },
                isPhoneNumber: true,
                error: errorSmsCode,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomButtonWidget(
                title: r'Xác nhận',
                thumbnail: Colors.blue,
                width: 200,
                height: 48,
                onPress: () async {
                  if (smsCode == null) {
                    errorSmsCode = r'Mã xác thực không được để trống';
                  } else {
                    errorSmsCode = null;
                  }
                  setState(() {});
                  if (errorSmsCode != null) {
                    return;
                  } else {
                    final credential = PhoneAuthProvider.credential(
                        verificationId: widget.verificationId!,
                        smsCode: smsCode!);

                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(credential)
                          .then((value) => {
                                Navigator.pushNamed(
                                    context, RoutingMobilePath.home)
                              });
                    } catch (e) {}
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
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
