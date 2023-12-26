import 'package:example/routes/routes.dart';
import 'package:flutter/material.dart';


class AppPage {
  static List pages = [
    RouteModel(
      AppRoutes.INIT,
      Container(),
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
