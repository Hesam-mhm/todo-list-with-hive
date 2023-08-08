// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_task_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyTaskAdapter extends TypeAdapter<MyTask> {
  @override
  final int typeId = 0;

  @override
  MyTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyTask(
      name: fields[0] as String,
      isDone: fields[1] as bool?,
      periority: fields[2] as Periority,
    );
  }

  @override
  void write(BinaryWriter writer, MyTask obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.isDone)
      ..writeByte(2)
      ..write(obj.periority);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PeriorityAdapter extends TypeAdapter<Periority> {
  @override
  final int typeId = 1;

  @override
  Periority read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Periority.low;
      case 1:
        return Periority.normal;
      case 2:
        return Periority.high;
      default:
        return Periority.low;
    }
  }

  @override
  void write(BinaryWriter writer, Periority obj) {
    switch (obj) {
      case Periority.low:
        writer.writeByte(0);
        break;
      case Periority.normal:
        writer.writeByte(1);
        break;
      case Periority.high:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeriorityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
