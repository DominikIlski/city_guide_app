import 'package:json_annotation/json_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LatLngConverter implements JsonConverter<LatLng, Map<String, dynamic>> {
  const LatLngConverter();
  @override
  LatLng fromJson(Map<String, dynamic> json) =>
      LatLng(json['lat'], json['lon']);

  @override
  Map<String, dynamic> toJson(LatLng latLng) =>
      <String, dynamic>{'lat': latLng.latitude, 'lon': latLng.longitude};
}