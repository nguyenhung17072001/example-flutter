import 'package:flutter/material.dart';


class WorkRoute extends StatefulWidget {
  late String routeName;
  late String progress;
  late Widget? child;


  WorkRoute({
    Key? key, 
    required this.routeName, 
    required this.progress, 
    this.child
  }): super(key: key);

  @override
  State<WorkRoute> createState() => _WorkRouteState();
}

class _WorkRouteState extends State<WorkRoute> {
  late String _routeName;
  late String _progress;
  late Widget? _child; 

  late bool _isContent = false;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _routeName = widget.routeName;
    _child = widget.child;
    _progress = widget.progress;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                _isContent = !_isContent;
              });
            },
            icon: const Icon(
              Icons.location_on,
              color: Color(0xffF89C0D),
            ),
            label: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    _routeName,
                    style: const TextStyle(
                      color: Color(0xff262626),
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      _progress,
                      style: const TextStyle(
                        color: Color(0xff262626),
                        fontSize: 16,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: Color(0xff8C8C8C)),
                  ],
                )
              ],
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                 RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12.0),
                    topRight: const Radius.circular(12.0),
                    bottomLeft: _isContent ? const Radius.circular(0.0): const Radius.circular(12.0),
                    bottomRight: _isContent ? const Radius.circular(0.0): const Radius.circular(12.0),
                  ),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffF2F5F8)),
            ),
          ),
          
          if (_child != null && _isContent) 
          ...[Expanded(
            child: Container(
              color: const Color(0xffF2F5F8),
              child: _child!,
            )
            
          )],
         
        ],
      ),
    );
  }
}






