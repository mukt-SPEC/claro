import 'package:claro/data/hive_data_store.dart';
import 'package:claro/views/home/widget/home.dart';
import 'package:claro/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

late Box todoBox;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Tasks>(TasksAdapter());
  var todoBox = await Hive.openBox<Tasks>(HiveDataStore.tasksBox);
  todoBox.values.forEach((task) {
    if (task.creationTime!.day != DateTime.now().day) {}
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}
