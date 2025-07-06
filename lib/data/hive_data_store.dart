import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/todo_model.dart';

class HiveDataStore {
  static const tasksBox = 'tasksBox';
  final Box<Tasks> box = Hive.box<Tasks>(tasksBox);
  Future<void> addTask(Tasks task) async {
    await box.put(task.id, task);
  }

  Future<Tasks?> getTask(String id) async {
    return box.get(id);
  }

  Future<void> updateTask(Tasks task) async {
    await task.save();
  }

  Future<void> deleteTask(Tasks task) async {
    await task.delete();
  }

  ValueListenable<Box<Tasks>> tasksListenable() {
    return box.listenable();
  }
}
