import 'package:example/widgets/index.dart';
import 'package:flutter/material.dart';

class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Log', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.amber,
        actions: [
          
        ]
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Thông tin check in:'),
            Log_Button(
              onPressed: () {},
              child: Text('zzz'),
            ),
            //Log_Button(),

          ],
        )
      ),
    );
  }
}