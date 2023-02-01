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
      final idCard = settings.arguments as IdCardModel;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => IdCardPage(
          idCard: idCard,
        ),
      );
    case RoutingMobilePath.birthCertification:
      final birthCertification = settings.arguments as BirthCertificationModel;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => BirthCertificatePage(
          birthCertification: birthCertification,
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
