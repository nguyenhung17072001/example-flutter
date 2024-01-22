import 'package:example/bloc/auth/auth_bloc.dart';
import 'package:example/routes/pages.dart';
import 'package:example/utils/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'di/injection_container.dart';
import 'routes/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _requestPermission();
    
  }
  Future<void> _requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {

      // ignore: use_build_context_synchronously
      bool openSettings = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Yêu cầu quyền vị trí'),
            content: const Text('Ứng dụng cần truy cập vị trí để hoạt động.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Đồng ý'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: const Text('Cài đặt'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        },
      );

      if (openSettings) {
        await Geolocator.openAppSettings();
      }
    }
  }
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
        child: ScreenUtilInit(
          designSize: const Size(414, 1040),
          minTextAdapt: true,
          splitScreenMode: true,
          
          builder: (_ , child) {
            return MaterialApp(
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
            );
          }
        ),
      ),
    );
  }
}
