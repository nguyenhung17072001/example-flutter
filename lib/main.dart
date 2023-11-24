import 'package:example/flow/blocs/bloc_observer.dart';
import 'package:example/flow/blocs/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'flow/blocs/authen_bloc.dart';
import 'src/navigation/navigation_container.dart';


void main() {
  Bloc.observer = BlocObserver2();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context)=>OrderBloc(),
        ),
        BlocProvider(
          create: (context)=>AuthenBloc(),
        ),
        
      ],
      child: MaterialApp(
        home: NavigationContainer(),
    ),
    );
  }
}


