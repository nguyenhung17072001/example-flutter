
import 'package:example/flow/blocs/order_bloc.dart';
import 'package:example/flow/state/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, state) {
        if(state is OrderStateSuccess) {
          print('data: ${state.foods}');
        }
      },
      child: Text('hung'),
    );
  }
}