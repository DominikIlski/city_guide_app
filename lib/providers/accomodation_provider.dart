import 'package:city_guide_app/models/base_info.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';
import '../utils/utils.dart';

part 'accomodation_provider.g.dart';

const _uuid = Uuid();

@immutable
@JsonSerializable()
@LatLngConverter()
class Accomodation extends BaseInfo {
  const Accomodation(String name, String description, LatLng place,
      List<String> images, String id)
      : super(name, description, place, images, id: id);
  factory Accomodation.fromJson(Map<String, dynamic> json) =>
      _$AccomodationFromJson(json);

  @override
  Icon get typeIcon => Icon(Icons.hotel_outlined);
}

class AccomodationNotifier extends StateNotifier<List<Accomodation>> {
  AccomodationNotifier([List<Accomodation>? initialEvents])
      : super(initialEvents ?? []);
}
