import 'package:city_guide_app/models/base_info.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';
import '../utils/utils.dart';

part 'event_provider.g.dart';

const _uuid = Uuid();


@immutable
@JsonSerializable()
@LatLngConverter()
class Event extends BaseInfo {
  const Event(String name, String description, LatLng place,
      List<String> images, String id)
      : super(name, description, place, images, id: id);
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

}


class EventsNotifier extends StateNotifier<List<Event>> {
  EventsNotifier([List<Event>? initialEvents]) : super(initialEvents ?? []);
}
