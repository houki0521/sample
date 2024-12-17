// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreDataAdapter extends TypeAdapter<StoreData> {
  @override
  final int typeId = 0;

  @override
  StoreData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoreData(
      storeImages: (fields[0] as List).cast<String>(),
      storeName: fields[1] as String,
      prText: fields[2] as String,
      featureText: fields[3] as String,
      commitment: fields[4] as String,
      seatImages: (fields[5] as List).cast<String>(),
      seatText: fields[6] as String,
      coursImages: (fields[7] as List).cast<String>(),
      coursText: fields[8] as String,
      menuImages: (fields[9] as List).cast<String>(),
      menuText: fields[10] as String,
      drinkImages: (fields[11] as List).cast<String>(),
      drinkText: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StoreData obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.storeImages)
      ..writeByte(1)
      ..write(obj.storeName)
      ..writeByte(2)
      ..write(obj.prText)
      ..writeByte(3)
      ..write(obj.featureText)
      ..writeByte(4)
      ..write(obj.commitment)
      ..writeByte(5)
      ..write(obj.seatImages)
      ..writeByte(6)
      ..write(obj.seatText)
      ..writeByte(7)
      ..write(obj.coursImages)
      ..writeByte(8)
      ..write(obj.coursText)
      ..writeByte(9)
      ..write(obj.menuImages)
      ..writeByte(10)
      ..write(obj.menuText)
      ..writeByte(11)
      ..write(obj.drinkImages)
      ..writeByte(12)
      ..write(obj.drinkText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
