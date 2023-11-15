import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeCard extends StatefulWidget {
  final Map? item;
  
  HomeCard({this.item});

  @override
  State<StatefulWidget> createState() {
    return _HomeCardState();
  }

}


class _HomeCardState extends State<HomeCard> {
  late Map _item;
  
  @override
  void initState() {
    super.initState();
    _item = widget.item!;
    
  }

  @override
  Widget build(BuildContext context) {
    //print(_item['name'].runtimeType);
    return SizedBox(
      height: 500,
      
      child: Material(
        elevation: 2,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {}, 
                  child: Icon(
                    CupertinoIcons.heart, 
                    color: Colors.red,
                  )
                ),
              ],
            ),
            Center(
              child: Image.asset(_item['image']),
            ),
            Text(_item['name'], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text(_item['price'])
              ],
            )
          ]
        ),
      ),
    );
  }

}
