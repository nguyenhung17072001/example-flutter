import 'package:example/theme/index.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnotherLogin extends StatelessWidget {
  late Color? backgroundColor;
  late Color? textColor;
  late void Function() onPressed;
  late String label;
  late Widget icon;


  AnotherLogin({
    super.key, 
    this.backgroundColor, 
    this.textColor, 
    required this.label, 
    required this.onPressed,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      //height: 60,
      child: TextButton.icon(
        icon: icon,
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.fromLTRB(40, 15, 40, 15)),
          onPressed: onPressed,
          label: Text(
            label,
            style: TextStyle(color: textColor, fontSize: 14),
          )),
    );
  }
}
