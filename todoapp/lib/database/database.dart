import 'package:hive_flutter/hive_flutter.dart';

class todoDataBase {
  List todoList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    todoList = [
      ['Make tutorial', false],
      ['Do exercise', false]
    ];
  }

  void loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  void updateData() {
    _myBox.put('TODOLIST', todoList);
  }
}
