import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  final T value;
  final List<DropdownMenuItem<T>> items;
  final Color color;
  final Function(T) onChanged;
  final String Function(T) validator;
  final String label, hint;

  const CustomDropDown({
    Key key,
    this.color = Colors.white,
    this.label,
    @required this.hint,
    @required this.items,
    @required this.validator,
    @required this.value,
    this.onChanged,
  }) : super(key: key);

  static const radius = BorderRadius.all(Radius.circular(10));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: radius,
      ),
      child: DropdownButtonFormField<T>(
        value: value,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        items: items,
        onChanged: onChanged,
        decoration: InputDecoration(
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
        ),
      ),
    );
  }
}
