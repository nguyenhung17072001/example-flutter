import 'package:example/theme/index.dart';
import 'package:flutter/material.dart';


class TextInput extends StatefulWidget {
  late TextEditingController? controller;
  late String? labelText;
  late IconData? icon;
  late TextInputType? keyboardType;
  late bool? obscureText;

  TextInput({
    super.key,  
    this.controller, 
    required this.labelText, 
    this.icon,
    this.keyboardType,
    this.obscureText,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late TextEditingController? _controller;
  late String? _labelText;
  late IconData? _icon;
  late TextInputType? _keyboardType;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  
    _labelText = widget.labelText;
    _icon = widget.icon;
    _keyboardType = widget.keyboardType;
    _obscureText = widget.obscureText ?? false;
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: TextField(
        obscureText: _obscureText,
        controller: _controller,
        keyboardType: _keyboardType?? TextInputType.text,
        decoration: InputDecoration(
          labelText: _labelText,
          labelStyle: const TextStyle(
            fontFamily: 'Roboto-Regular',
            color: Color(0xff3B3B3B),
          ),
          prefixIcon: Icon(
            _icon,
            //color: AppColors.primaryColor,
          ),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            //borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE6E6E6))),
        ),
      ),
    );
  }
}
