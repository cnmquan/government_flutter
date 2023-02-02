import 'package:flutter/material.dart';

import '../../models.dart';
import '../../pages/web.dart';
import 'routing_web_path.dart';

Route<dynamic> routeWebController(RouteSettings settings) {
  final routingPath = settings.name;

  switch (routingPath) {
    case RoutingWebPath.home:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const HomePage(),
      );
    case RoutingWebPath.searchInformation:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SearchInformationPage(),
      );
    case RoutingWebPath.acceptRequest:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const AcceptRequestPage(),
      );
    case RoutingWebPath.manageEmployees:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const ManageEmployeePage(),
      );
    case RoutingWebPath.statisticPeople:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const StatisticPeoplePage(),
      );
    case RoutingWebPath.statisticReport:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const StatisticReportPage(),
      );
    case RoutingWebPath.signIn:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SignInPage(),
      );
    case RoutingWebPath.forgetPassword:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const ForgetPasswordPage(),
      );
    case RoutingWebPath.residentInfo:
      var resident = settings.arguments as ResidentModel?;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => ResidentInfoPage(resident: resident),
      );
    case RoutingWebPath.idCard:
      var idCard = settings.arguments as IdCardModel?;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => IdCardPage(idCard: idCard),
      );
    case RoutingWebPath.birthCertificate:
      var birthCertification = settings.arguments as BirthCertificationModel;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) =>
            BirthCertificationPage(birthCertification: birthCertification),
      );
    case RoutingWebPath.registrationBook:
      var registrationBookId = settings.arguments;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => RegistrationBookPage(
            registrationBookId: registrationBookId as String?),
      );
    case RoutingWebPath.familyInfo:
      var familyId = settings.arguments;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) =>
            FamilyInformationPage(familyId: familyId as String?),
      );
    case RoutingWebPath.requestResident:
      var requestModel = settings.arguments as RequestModel?;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => RequestResidentPage(requestModel: requestModel),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const NotFoundPage(),
      );
  }
}
