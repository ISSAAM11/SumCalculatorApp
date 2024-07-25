// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sumItem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SumItemAdapter extends TypeAdapter<SumItem> {
  @override
  final int typeId = 0;

  @override
  SumItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SumItem(
      title: fields[0] as String,
      productsMap: (fields[1] as Map).cast<String, double>(),
      participantsMap: (fields[2] as Map).cast<String, double>(),
    );
  }

  @override
  void write(BinaryWriter writer, SumItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.productsMap)
      ..writeByte(2)
      ..write(obj.participantsMap);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SumItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
