import 'package:example/routes/routes.dart';
import 'package:example/view/splash/splash.dart';
import 'package:flutter/material.dart';


class AppPage {
  static List pages = [
    RouteModel(
      AppRoutes.SPLASH,
      Splash(),
    ),
    RouteModel(
      AppRoutes.MAIN2,
      Container(),
    ),
  ];
}

class RouteModel {
  String name;
  Widget page;

  RouteModel(this.name, this.page);
}
