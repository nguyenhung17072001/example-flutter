

import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final Widget? icon;
  final String? labelText;
  final void Function(String)? onChanged;


  const AuthTextField({this.icon, this.labelText, this.onChanged});
   
   

  
  

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late Widget _icon;
  late String _labelText;
  late void Function(String)? _onChanged;
  
  final myController = TextEditingController();
  
  
  @override
  void initState() {
    _icon = widget.icon ?? const SizedBox(); 
    _labelText = widget.labelText ?? '';
    _onChanged = widget.onChanged;

    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        onChanged: _onChanged,
        style: const TextStyle(
          color: Color.fromARGB(255, 16, 14, 14),
        ),
        decoration: InputDecoration(
          
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none
            
          ),
          labelText: _labelText,
          alignLabelWithHint: false,
          labelStyle: const TextStyle(
            color: Color.fromRGBO(102, 97, 97, 100),
        
            fontSize: 14
            

          ),
          prefixIcon: _icon,
        ),
      ),
    );
  }
}