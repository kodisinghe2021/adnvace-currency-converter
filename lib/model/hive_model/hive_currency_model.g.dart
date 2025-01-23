// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_currency_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCurrencyModelAdapter extends TypeAdapter<HiveCurrencyModel> {
  @override
  final int typeId = 1;

  @override
  HiveCurrencyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCurrencyModel(
      code: fields[0] == null ? '' : fields[0] as String,
      name: fields[1] == null ? '' : fields[1] as String,
      country: fields[2] == null ? '' : fields[2] as String,
      countryCode: fields[3] == null ? '' : fields[3] as String,
      flag: fields[4] == null ? '' : fields[4] as String,
      rateOnBase: fields[5] == null ? 0.0 : fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCurrencyModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.countryCode)
      ..writeByte(4)
      ..write(obj.flag)
      ..writeByte(5)
      ..write(obj.rateOnBase);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCurrencyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
