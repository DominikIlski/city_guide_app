// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      json['name'] as String,
      json['description'] as String,
      const LatLngConverter().fromJson(json['place'] as Map<String, dynamic>),
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      json['id'] as String,
      json['video'] as String,
    );

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'place': const LatLngConverter().toJson(instance.place),
      'images': instance.images,
      'video': instance.video,
    };
