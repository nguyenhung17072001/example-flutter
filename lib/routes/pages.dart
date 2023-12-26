
import 'package:example/routes/index.dart';
import 'package:example/view/auth/index.dart';
import 'package:flutter/material.dart';


class AppPage {
  static List pages = [
    RouteModel(
      AppRoutes.SPLASH,
      Login(),
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
