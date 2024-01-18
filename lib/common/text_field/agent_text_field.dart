import 'package:flutter/material.dart';

class AgentTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final IconData? icon;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;



  AgentTextField({
    super.key,
    this.controller,
    required this.labelText, 
    this.icon,
    this.keyboardType,
    this.onChanged,
  });

  @override
  State<AgentTextField> createState() => _AgentTextFieldState();
}

class _AgentTextFieldState extends State<AgentTextField> {
  late TextEditingController? _controller;
  late String? _labelText;
  late IconData? _icon;
  late TextInputType? _keyboardType;
  late void Function(String)? _onChanged;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _labelText = widget.labelText;
    _icon = widget.icon;
    _onChanged = widget.onChanged;
    _keyboardType = widget.keyboardType;
  }




  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffE5EAF0),
          
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: TextField(
          
            controller: _controller,
            keyboardType: _keyboardType?? TextInputType.text,
            onChanged: _onChanged,
            decoration: InputDecoration(
              
              contentPadding: EdgeInsets.all(8),
              labelText: _labelText,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto-Regular',
                color: Color(0xff837C73),
              ),
              
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
            ),
          ),
      ),
    );
  }
}