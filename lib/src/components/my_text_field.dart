import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final Widget? icon;
  final String? labelText;
  
  const AuthTextField({this.icon, this.labelText});
   
   

  
  

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late Widget _icon;
  late String _labelText;

  
  
  @override
  void initState() {
    
    _icon = widget.icon!;
    _labelText = widget.labelText!;
    
  }

  

  @override
  Widget build(BuildContext context) {
    print(widget.labelText);
    return const Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(
          color: Colors.red,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        
          //labelText: _labelText,
          labelStyle: TextStyle(),
          //prefixIcon: _icon,
        ),
      ),
    );
  }
}