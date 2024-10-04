// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 0;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather(
      name: fields[0] as String?,
      conditionText: fields[1] as String?,
      temperature: fields[2] as double?,
      windDegree: fields[3] as int?,
      windDir: fields[4] as String?,
      windMph: fields[5] as double?,
      windKph: fields[6] as double?,
      humidity: fields[7] as int?,
      pressureIn: fields[8] as double?,
      pressureMb: fields[9] as double?,
      visibilityKm: fields[10] as double?,
      visibilityMiles: fields[11] as double?,
      conditionIcon: fields[12] as String?,
      date: fields[13] as String?,
      dateEpoch: fields[14] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.conditionText)
      ..writeByte(2)
      ..write(obj.temperature)
      ..writeByte(3)
      ..write(obj.windDegree)
      ..writeByte(4)
      ..write(obj.windDir)
      ..writeByte(5)
      ..write(obj.windMph)
      ..writeByte(6)
      ..write(obj.windKph)
      ..writeByte(7)
      ..write(obj.humidity)
      ..writeByte(8)
      ..write(obj.pressureIn)
      ..writeByte(9)
      ..write(obj.pressureMb)
      ..writeByte(10)
      ..write(obj.visibilityKm)
      ..writeByte(11)
      ..write(obj.visibilityMiles)
      ..writeByte(12)
      ..write(obj.conditionIcon)
      ..writeByte(13)
      ..write(obj.date)
      ..writeByte(14)
      ..write(obj.dateEpoch);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
