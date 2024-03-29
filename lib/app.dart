import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'utils/routing.dart';

@WidgetbookApp(
  name: 'Government Demo',
  themeType: ThemeData,
  devices: [
    Apple.iPhone13,
    Samsung.s21ultra,
    Apple.iMacM1,
  ],
)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return MaterialApp(
        title: 'Government Demo Web',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Century',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutingWebPath.signIn,
        onGenerateRoute: routeWebController,
      );
    }
    return MaterialApp(
      title: 'Government Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Century',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutingMobilePath.signIn,
      onGenerateRoute: routeMobileController,
    );
  }
}
