import 'package:example/flow/blocs/order_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocObserver2 extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    if(bloc is OrderBloc){
      print("Transition: $transition");
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    if(bloc is OrderBloc){
      print("Change: $change");
    }

  }
}