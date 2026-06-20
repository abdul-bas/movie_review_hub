// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieModelAdapter extends TypeAdapter<MovieModel> {
  @override
  final int typeId = 2;

  @override
  MovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieModel(
      id: fields[0] as String?,
      userId: (fields[1] as List?)?.cast<String>(),
      comment: (fields[2] as List?)
          ?.map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
      tittle: fields[3] as String,
      genre: fields[4] as String,
      language: fields[5] as String,
      link: fields[6] as String,
      description: fields[7] as String,
      points: fields[8] as String,
      castImages: (fields[10] as List).cast<String>(),
      castNames: (fields[11] as List).cast<String>(),
      movieImages: (fields[9] as List).cast<String>(),
      rating: fields[12] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.comment)
      ..writeByte(3)
      ..write(obj.tittle)
      ..writeByte(4)
      ..write(obj.genre)
      ..writeByte(5)
      ..write(obj.language)
      ..writeByte(6)
      ..write(obj.link)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.points)
      ..writeByte(9)
      ..write(obj.movieImages)
      ..writeByte(10)
      ..write(obj.castImages)
      ..writeByte(11)
      ..write(obj.castNames)
      ..writeByte(12)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
