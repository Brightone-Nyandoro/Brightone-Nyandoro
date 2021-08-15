import 'package:cut_school_map/ui/custom_components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final Color? color;
  final isPassword;
  final TextEditingController? controller;
  final keyboardType;
  final style;
  final validator;
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.color,
    this.isPassword,
    this.controller,
    this.keyboardType,
    this.style,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        onChanged: onChanged,
        cursorColor: color,
        keyboardType: keyboardType,
        style: style,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: color,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
