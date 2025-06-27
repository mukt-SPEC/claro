import 'package:hive/hive.dart';

part 'todo_model.g.dart';
@HiveType(typeId: 00)
class Tasks extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  bool isCompleted;
  @HiveField(3)
  DateTime? creationDate;

  Tasks({
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.creationDate,
  });

  

}