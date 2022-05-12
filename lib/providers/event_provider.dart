import 'package:city_guide_app/models/base_info.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

@immutable
class Event extends BaseInfo {
  const Event(String name, String description, LatLng place,
      List<String> images, String id)
      : super(name, description, place, images, id: id);
}


class EventList extends StateNotifier<List<Event>> {
  EventList([List<Event>? initialEvents]) : super(initialEvents ?? []);

}