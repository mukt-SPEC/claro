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

  @HiveField(4)
  String? id;

  @HiveField(5)
  DateTime? creationTime;

  Tasks({
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.creationDate,
    required this.id,
    required this.creationTime,
  });

  // factory Tasks.copyWith({
  //   String? title,
  //   String? description,
  //   bool? isCompleted,
  //   DateTime? creationDate,
  //   DateTime? creationTime,
  //   String? id,
  // }) {
  //   return Tasks(
  //     title: title ?? '',
  //     description: description ?? "",
  //     isCompleted: isCompleted ?? false,
  //     creationDate: creationDate ?? DateTime.now(),
  //     creationTime: creationTime ?? DateTime.now(),
  //     id: const Uuid().v1(),
  //   );
  // }

  Tasks copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? creationDate,
    String? id,
    DateTime? creationTime,
  }) {
    return Tasks(
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      creationDate: creationDate ?? this.creationDate,
      id: id ?? this.id,
      creationTime: creationTime ?? this.creationTime,
    );
  }
}
