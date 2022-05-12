import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

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
