import 'package:city_guide_app/models/base_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';

import '../utils/utils.dart';

part 'places_provider.g.dart';

@immutable
@JsonSerializable()
@LatLngConverter()
class Place extends BaseInfo {
  final String video;
  const Place(String name, String description, LatLng place,
      List<String> images, String id, this.video)
      : super(name, description, place, images, id: id);
  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  @override
  Icon get typeIcon => Icon(Icons.place_outlined);
}

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier([List<Place>? initialPlaces])
      : super(initialPlaces ?? []);
}