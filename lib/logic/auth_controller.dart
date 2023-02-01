import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:goverment_flutter_system/logic/firebase_controller.dart';
import 'package:goverment_flutter_system/logic/user_controller.dart';

class AuthController extends FirebaseController {
  void signUpWithPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+44 7123 123 456',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<Map<String, String?>> signUpResident({
    required String phoneNumber,
    required String password,
    required String email,
  }) async {
    String? error;
    try {
      await UserController().createResidentAccount(
        phoneNumber: phoneNumber,
        email: email,
      );

      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // var acs = ActionCodeSettings(
      //   // URL you want to redirect back to. The domain (www.example.com) for this
      //   // URL must be whitelisted in the Firebase Console.
      //   url: 'https://www.example.com/finishSignUp?cartId=1234',
      //   // This must be true
      //   handleCodeInApp: true,
      //   iOSBundleId: 'com.example.ios',
      //   androidPackageName: 'com.example.android',
      //   // installIfNotAvailable
      //   androidInstallApp: true,
      //   // minimumVersion
      //   androidMinimumVersion: '12',
      // );
      // await auth
      //     .sendSignInLinkToEmail(email: email, actionCodeSettings: acs)
      //     .catchError((onError) {
      //   debugPrint('Error sending email verification $onError');
      //   error = r'Xảy ra lỗi trong quá trình gửi xác thực';
      // });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        error = r'Mật khẩu bạn cung cấp không đủ mạnh';
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        error = r'Email ban cung cấp đã tồn tại';
      }
    } catch (e) {
      debugPrint('$e');
      error = r'Xảy ra lỗi trong quá trình đăng ký';
    }
    if (error != null) {
      return {
        'result': 'Send Verify Failed',
        'error': error,
      };
    } else {
      return {
        'result': 'Send Verify Success',
        'error': null,
      };
    }
  }

  Future<Map<String, String?>> signInResident(
      {required String phoneNumber, required String password}) async {
    try {
      Map<String, String?> emailResponse =
          await UserController().getResidentEmail(phoneNumber);
      if (emailResponse['error'] != null) {
        return {
          'error': emailResponse['error'],
        };
      }
      String email = emailResponse['email']!;
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (credential.user != null) {
        return {'result': 'Success Sign In'};
      } else {
        return {'error': 'Đăng nhập thất bại'};
      }
    } catch (e) {
      debugPrint('$e');
      return {'error': r'Xảy ra lỗi trong quá trình đăng nhập'};
    }
  }
}
