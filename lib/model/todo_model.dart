// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class Tasks extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  bool? isCompleted;
  @HiveField(3)
  DateTime? creationDate;

  Tasks({
    this.title,
    this.description,
    this.isCompleted = false,
    this.creationDate,
  });

  Tasks copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? creationDate,
  }) {
    return Tasks(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      creationDate: creationDate ?? this.creationDate,
    );
  }
}
