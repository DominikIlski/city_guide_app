import 'package:city_guide_app/models/base_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';

import '../utils/utils.dart';



@immutable
@JsonSerializable( explicitToJson: true)
@LatLngConverter()
class Guide {
  final String id;
  final String name;
  final String description;
  final List<BaseInfo> list;

  const Guide(this.id, this.name, this.description, this.list);
}

class GuideNotifier extends StateNotifier<List<Guide>> {
  GuideNotifier([List<Guide>? initialGuides])
      : super(initialGuides ?? []);
}