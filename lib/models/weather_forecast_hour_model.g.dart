// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_hour_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForecastHourAdapter extends TypeAdapter<ForecastHour> {
  @override
  final int typeId = 1;

  @override
  ForecastHour read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForecastHour(
      timeEpoch: fields[0] as int?,
      time: fields[1] as String?,
      temperature: fields[2] as double?,
      conditionText: fields[3] as String?,
      conditionIcon: fields[4] as String?,
      windMph: fields[5] as double?,
      windKph: fields[6] as double?,
      windDegree: fields[7] as int?,
      windDir: fields[8] as String?,
      pressureMb: fields[9] as double?,
      pressureIn: fields[10] as double?,
      humidity: fields[11] as int?,
      visibilityKm: fields[12] as double?,
      visibilityMiles: fields[13] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, ForecastHour obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.timeEpoch)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.temperature)
      ..writeByte(3)
      ..write(obj.conditionText)
      ..writeByte(4)
      ..write(obj.conditionIcon)
      ..writeByte(5)
      ..write(obj.windMph)
      ..writeByte(6)
      ..write(obj.windKph)
      ..writeByte(7)
      ..write(obj.windDegree)
      ..writeByte(8)
      ..write(obj.windDir)
      ..writeByte(9)
      ..write(obj.pressureMb)
      ..writeByte(10)
      ..write(obj.pressureIn)
      ..writeByte(11)
      ..write(obj.humidity)
      ..writeByte(12)
      ..write(obj.visibilityKm)
      ..writeByte(13)
      ..write(obj.visibilityMiles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastHourAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
