// ignore: file_names
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todoapp/Utils/Buttons.dart';

class DialogBox extends StatelessWidget {
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
  });

  final TextEditingController controller;
  VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Container(
        height: 130,
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid, color: Colors.white)),
                  hintText: 'Add Items'),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(text: 'Save', onPressed: onSave),
                const SizedBox(
                  width: 4,
                ),
                MyButtons(
                    text: 'Cancel',
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
