import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/index.dart';

class AgentTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final IconData? icon;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? isObligatory;

  AgentTextField({
    Key? key,
    this.controller,
    required this.labelText,
    this.icon,
    this.keyboardType,
    this.onChanged,
    this.isObligatory
  }) : super(key: key);

  @override
  State<AgentTextField> createState() => _AgentTextFieldState();
}

class _AgentTextFieldState extends State<AgentTextField> {
  late TextEditingController? _controller;
  late String? _labelText;
  late IconData? _icon;
  late TextInputType? _keyboardType;
  late void Function(String)? _onChanged;
  late bool? _isObligatory;


  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _labelText = widget.labelText;
    _icon = widget.icon;
    _onChanged = widget.onChanged;
    _keyboardType = widget.keyboardType;
    _isObligatory = widget.isObligatory ?? false;
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: _focusNode.hasFocus ? Color(0xFF1B74E4) : Color(0xffE5EAF0),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 14.h,
          bottom: 14.h,
          left: SizeConfig.w14,
          right: SizeConfig.w14,
        ),
        child: Focus(
          onFocusChange: (hasFocus) {
            if (hasFocus) {
              setState(() {
                //_labelText = 'Focused Label';
              });
            } else {
              setState(() {
                 //_labelText = widget.labelText;
              });
            }
          },
          child: TextField(
            focusNode: _focusNode,
            controller: _controller,
            keyboardType: _keyboardType ?? TextInputType.text,
            onChanged: _onChanged,
            cursorHeight: 28.h,
            cursorColor: const Color(0xff262626),
            
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
              
              label: Row(
                children: [
                  Text(_labelText!),
                  _isObligatory! && _isObligatory != null ? const Text(
                    "*",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffD10011)
                    ),
                  ): const SizedBox(),
                  
                ],
              ),
              labelStyle: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto-Regular',
                color: _focusNode.hasFocus ? const Color(0xFF1B74E4) : const Color(0xff837C73)
              ),
              alignLabelWithHint: false,
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
