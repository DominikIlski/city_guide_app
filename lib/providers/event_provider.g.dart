// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      json['name'] as String,
      json['description'] as String,
      const LatLngConverter().fromJson(json['place'] as Map<String, dynamic>),
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      json['id'] as String,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'place': const LatLngConverter().toJson(instance.place),
      'images': instance.images,
    };
