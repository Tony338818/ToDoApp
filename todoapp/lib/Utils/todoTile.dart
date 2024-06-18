// ignore_for_file: prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

class todoTile extends StatelessWidget {
  todoTile(
      {super.key,
      required this.text,
      required this.taskCompleted,
      required this.onchanged});

  final String text;
  final bool taskCompleted;
  Function(bool?)? onchanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                activeColor: Colors.black,
                onChanged: onchanged,
              ),
              Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 3,
                    decorationColor: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
