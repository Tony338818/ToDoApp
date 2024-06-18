// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  MyButtons({super.key, required this.text, required this.onPressed});

  final String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Title(
          child: Text(text),
          color: Colors.white,
        ),
      ),
      color: Colors.white,
    );
  }
}
