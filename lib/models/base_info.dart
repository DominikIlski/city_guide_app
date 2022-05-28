import 'package:city_guide_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
@JsonSerializable()
@LatLngConverter()
abstract class BaseInfo {
  final String id;
  final String name;
  final String description;
  final LatLng place;
  final List<String> images;

  const BaseInfo(this.name, this.description, this.place, this.images,
      {required this.id});

  

  Icon get typeIcon => Icon(Icons.abc);
}
