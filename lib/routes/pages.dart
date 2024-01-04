
import 'package:example/routes/index.dart';
import 'package:example/view/auth/index.dart';
import 'package:example/view/main/home.dart';
import 'package:flutter/material.dart';




class AppPage {
  static List pages = [
    RouteModel(
      AppRoutes.INIT,
      const Login(),
    ),
    RouteModel(
      AppRoutes.MY_TAB,
      const BottomTab(),
    ),
    
  ];
}

class RouteModel {
  String name;
  Widget page;

  RouteModel(this.name, this.page);
}
