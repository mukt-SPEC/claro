import 'package:claro/data/hive_data_store.dart';
import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  HiveDataStore? todoDb;
  TaskProvider({required this.todoDb});
  
}
