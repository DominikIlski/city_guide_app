import 'package:city_guide_app/models/base_info.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';

@immutable
@JsonSerializable()

class Place extends BaseInfo {
  const Place(String name, String description, LatLng place,
      List<String> images, String id)
      : super(name, description, place, images, id: id);
}
