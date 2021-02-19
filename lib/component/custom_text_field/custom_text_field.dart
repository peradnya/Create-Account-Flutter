import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label, hint;
  final String Function(String) validator;
  final Function(String) onChanged;
  final Function onTap;
  final bool readOnly, password;
  final TextInputType textInputType;
  final Color color;
  final Widget head, tail;

  static const radius = BorderRadius.all(Radius.circular(10));

  const CustomTextField({
    Key key,
    @required this.controller,
    @required this.hint,
    @required this.validator,
    this.label,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.textInputType = TextInputType.text,
    this.color = Colors.white,
    this.password = false,
    this.head,
    this.tail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: radius,
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: textInputType,
        readOnly: readOnly,
        onTap: onTap,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        obscureText: password,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          labelText: label,
          floatingLabelBehavior: label == null
              ? FloatingLabelBehavior.never
              : FloatingLabelBehavior.always,
          hintText: hint,
          filled: true,
          fillColor: color,
          focusColor: color,
          hoverColor: color,
          border: InputBorder.none,
          prefixIcon: head,
          suffixIcon: tail,
        ),
      ),
    );
  }
}
