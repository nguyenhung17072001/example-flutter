

import 'package:example/src/models/food.dart';

class OrderEvent {
  final Food food;

  OrderEvent(this.food);

}

class OrderDeleteEvent extends OrderEvent {
  final String foodId;

  OrderDeleteEvent(this.foodId) : super(Food(id: foodId, name: '', image: '', price: '')); // Tạo một đối tượng Food để truyền ID

  @override
  String toString() => 'OrderDeleteEvent: $foodId';
}