import 'package:flutter/material.dart';

class textfieldWidget extends StatelessWidget {
  final label;
  final controller;
  
  textfieldWidget({
    super.key, required this.label, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffc0d6e4)
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: Color(0xff002955)
          ),
        ),
      ),
    );
  }
}