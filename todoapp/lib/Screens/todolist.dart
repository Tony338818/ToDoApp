// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:todoapp/Utils/DIalogBox.dart';
import 'package:todoapp/Utils/todoTile.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todoList extends StatefulWidget {
  const todoList({super.key});

  @override
  State<todoList> createState() => _todoListState();
}

class _todoListState extends State<todoList> {
  List todoList = [
    ['Finish ToDo App', false],
    ['Do exercise', false]
  ];

  void Function(bool?)? onChanged(bool value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
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
          : todoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
  }

  void onDelete(index) {
    setState(() {
      todoList.removeAt(index);
    });
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
      body: Slidable(
        endActionPane: ActionPane(motion: ScrollMotion(), children: [
          SlidableAction(
            onPressed: onDelete,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          )
        ]),
        child: Center(
            child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return todoTile(
              text: todoList[index][0],
              taskCompleted: todoList[index][1],
              onchanged: (value) {
                return onChanged(todoList[index][1], index);
              },
            );
          },
        )),
      ),
    );
  }
}
