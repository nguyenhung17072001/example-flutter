import 'package:flutter/material.dart';

class Log_Button extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;

  const Log_Button({super.key, required this.onPressed, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.amber,
          ),
          borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsetsDirectional.all(8),
          margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              child,
              TextButton.icon(
                onPressed: onPressed,
                icon: Icon(Icons.touch_app),
                label: Text("Xem chi tiết"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.red.withOpacity(0.3)),
                  side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(width: 1, color: Colors.blue)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              )
            ],
          ),
    );
  }
}
