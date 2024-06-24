// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:todoapp/Screens/todolist.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.initFlutter();
    var box = await Hive.openBox('myBox');
    runApp(const MyApp());
  } catch (e) {
    print('Error initializing Hive: $e');
    // Handle the error appropriately
  }
  // WidgetsFlutterBinding.ensureInitialized();

  // final directory = await getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  // await Hive.initFlutter();
  // var box = await Hive.openBox('myBox');
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      home: todoList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
