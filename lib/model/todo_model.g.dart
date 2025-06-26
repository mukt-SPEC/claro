// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksAdapter extends TypeAdapter<Tasks> {
  @override
  final int typeId = 0;

  @override
  Tasks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tasks(
      title: fields[0] as String,
      description: fields[1] as String,
      isCompleted: fields[2] as bool,
      creationDate: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Tasks obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.isCompleted)
      ..writeByte(3)
      ..write(obj.creationDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
