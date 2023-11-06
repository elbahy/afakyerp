import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.textFieldController,
    required this.labelText,
    required this.suffixIcon,
    super.key,
  });
  TextEditingController textFieldController;
  String labelText;
  IconData suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textFieldController,
      decoration: InputDecoration(
          suffixIcon: Icon(suffixIcon),
          label: Text(labelText),
          labelStyle: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
