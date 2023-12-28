import 'package:example/bloc/auth/auth_bloc.dart';
import 'package:example/routes/pages.dart';
import 'package:example/utils/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'di/injection_container.dart';
import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return OverlaySupport.global(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (BuildContext context) => AuthBloc(),
          ),
        ], 
        child: MaterialApp(
          title: 'Flutter Demo',
          navigatorKey: NavigatorUtils.instance.navigatorKey,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: AppRoutes.INIT,
          routes: {
            for (RouteModel e in AppPage.pages) e.name: (context) => e.page
          },
          navigatorObservers: [AppRouteTracking()],
        ),
      ),
    );
  }
}
