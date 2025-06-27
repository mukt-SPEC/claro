import 'package:claro/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

late Box todoBox;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Tasks>(TasksAdapter());
  todoBox = await Hive.openBox<Tasks>('tasks');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      
    ));
  }
}
