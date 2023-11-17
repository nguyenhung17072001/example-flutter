
import 'package:example/flow/blocs/order_bloc.dart';
import 'package:example/flow/state/order_state.dart';
import 'package:example/src/models/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OrderScreen> {


  late List<Food> foods;
  @override
  void initState() {
    super.initState();
  
    
    
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, state) {
        

        if(state is OrderStateSuccess) {
          setState(() {
            foods = state.foods;
          });

        }

        print('data======sdsdsdsdsdsdsd=====: ${foods}');
      },
      child: Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(45, 182, 163, 100),
        //iconTheme: const IconThemeData(color: Colors.black),
        //actions: [],
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: Text('hung dep tai')
    ),
    );
  }
}