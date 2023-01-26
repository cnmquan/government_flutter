import 'package:flutter/material.dart';

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
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const NotFoundPage(),
      );
  }
}
