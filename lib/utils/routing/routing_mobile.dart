import 'package:flutter/material.dart';
import 'package:goverment_flutter_system/models.dart';

import '../../pages/mobile.dart';
import 'routing_mobile_path.dart';

Route<dynamic> routeMobileController(RouteSettings settings) {
  final routingPath = settings.name;

  switch (routingPath) {
    case RoutingMobilePath.home:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const HomePage(),
      );
    case RoutingMobilePath.idCard:
      final arguments = settings.arguments as List<dynamic>;
      final idCard = arguments[0] as IdCardModel;
      final phoneNumber = arguments[1] as String;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => IdCardPage(
          idCard: idCard,
          phoneNumber: phoneNumber,
        ),
      );
    case RoutingMobilePath.birthCertification:
      final arguments = settings.arguments as List<dynamic>;
      final birthCertification = arguments[0] as BirthCertificationModel;
      final phoneNumber = arguments[1] as String;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => BirthCertificatePage(
          birthCertification: birthCertification,
          phoneNumber: phoneNumber,
        ),
      );
    case RoutingMobilePath.registrationBook:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const RegistrationBookPage(),
      );
    case RoutingMobilePath.requestPaper:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const RequestPaperPage(),
      );
    case RoutingMobilePath.requestList:
      final phoneNumber = settings.arguments as String;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => RequestListPage(
          phoneNumber: phoneNumber,
        ),
      );
    case RoutingMobilePath.familyInformation:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const FamilyInformationPage(),
      );
    case RoutingMobilePath.signIn:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SignInPage(),
      );
    case RoutingMobilePath.signInWithPhone:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SignInWithPhonePage(),
      );
    case RoutingMobilePath.verifyCode:
      String? verificationId = settings.arguments as String?;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => VerifyCodePage(
          verificationId: verificationId,
        ),
      );
    case RoutingMobilePath.signUp:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SignUpPage(),
      );
    case RoutingMobilePath.forgetPassword:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const ForgetPasswordPage(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const NotFoundPage(),
      );
  }
}
