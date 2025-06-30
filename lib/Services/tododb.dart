import 'package:claro/model/todo_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:async';

class TodoDb {
  final todobox = Hive.box<Tasks>('todoBox');

  List<Tasks?> todos = [];

  Future<int> addTodo({Tasks? task}) async {
    return await todobox.add(task!);
  }

  Future<void> editTodo(int? key, Tasks task) async {
    await todobox.put(key, task);
  }

  Future<void> deleteTodo(Tasks? task) async {
    await task!.delete();
  }

  List<Tasks> fetchTodo() {
    final todoLists = todobox.values.toList();
    return todoLists;
  }

  Future<void> tooglecomplete(Tasks task) async {
    task.isCompleted = !task.isCompleted!;
  }
}
