import 'package:equatable/equatable.dart';
import 'package:example/src/models/food.dart';

class OrderState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class OrderStateInitial extends OrderState {
  final List<Food> foods;

  OrderStateInitial(this.foods);


  @override
  // TODO: implement props
  List<Object?> get props => [foods];

}

class OrderStateSuccess extends OrderState {
  final List<Food> foods;

  OrderStateSuccess(this.foods);
  @override
  List<Object?> get props => [foods];
}



class OrderStateFail extends OrderState {

  final String err;
  OrderStateFail(this.err);

  @override
  List<Object?> get props => [err];
}