import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_serializable/builder.dart';
import 'package:json_serializable/type_helper.dart';
import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
abstract class BaseInfo {
  final String id;
  final String name;
  final String description;
  final LatLng place;
  final List<String> images;

  const BaseInfo(this.name, this.description, this.place, this.images,
      {required this.id});
}


