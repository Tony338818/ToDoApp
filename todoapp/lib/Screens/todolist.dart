// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/Utils/DIalogBox.dart';
import 'package:todoapp/Utils/todoTile.dart';
import 'package:todoapp/database/database.dart';
import 'package:hive/hive.dart';

class todoList extends StatefulWidget {
  const todoList({super.key});

  @override
  State<todoList> createState() => _todoListState();
}

final _myBox = Hive.box('myBox');
todoDataBase db = new todoDataBase();

class _todoListState extends State<todoList> {
  void Function(bool?)? onChanged(bool value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  TextEditingController controller = new TextEditingController();

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onSave: saveNewTask,
          );
        });
  }

  void saveNewTask() {
    setState(() {
      controller.text.isEmpty
          ? print('Text Field cannot be empty')
          : db.todoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void onDelete(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text(
          'TODO app',
          style: TextStyle(
              color: Color.fromARGB(255, 212, 178, 178), fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return todoTile(
            text: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onchanged: (value) {
              return onChanged(db.todoList[index][1], index);
            },
            ondelete: (context) => onDelete(index),
          );
        },
      )),
    );
  }
}
