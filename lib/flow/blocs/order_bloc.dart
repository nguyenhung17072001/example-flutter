import 'dart:async';

import 'package:example/flow/events/order_event.dart';
import 'package:example/flow/state/order_state.dart';
import 'package:example/src/models/food.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


List<Food> foods= [];

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc():super(OrderStateInitial(foods)){
    on<OrderEvent>(handleOrderEvent);
  }

  

  FutureOr<void> handleOrderEvent(OrderEvent event, Emitter<OrderState> emit) async {
    try {
      foods.add(event.food);
      emit(OrderStateSuccess(foods));
    } catch (e) {
      emit(OrderStateFail(e.toString()));
    }
  }
}


