// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForecastDayAdapter extends TypeAdapter<ForecastDay> {
  @override
  final int typeId = 2;

  @override
  ForecastDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForecastDay(
      date: fields[0] as String?,
      dateEpoch: fields[1] as int?,
      hour: (fields[2] as List?)?.cast<ForecastHour>(),
    );
  }

  @override
  void write(BinaryWriter writer, ForecastDay obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.dateEpoch)
      ..writeByte(2)
      ..write(obj.hour);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
