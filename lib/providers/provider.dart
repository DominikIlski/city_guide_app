import 'dart:math';

import 'package:city_guide_app/providers/accomodation_provider.dart';
import 'package:city_guide_app/providers/event_provider.dart';
import 'package:city_guide_app/providers/guide_provider.dart';
import 'package:city_guide_app/providers/places_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../data/dummy_data.dart';

import 'package:firebase_auth/firebase_auth.dart';

var auth = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

var authStateProv = StreamProvider<User?>((ref) {
  return ref.read(auth).authStateChanges();
});

var places_provider = StateNotifierProvider<PlacesNotifier, List<Place>>((ref) {
  var places = DummyData.places.map((e) => Place.fromJson(e)).toList();
  return PlacesNotifier(places);
});

var events_provider = StateNotifierProvider<EventsNotifier, List<Event>>((ref) {
  var events = DummyData.events.map((e) => Event.fromJson(e)).toList();
  return EventsNotifier(events);
});

var accomodation_provider =
    StateNotifierProvider<AccomodationNotifier, List<Accomodation>>((ref) {
  var accomodations =
      DummyData.accomodation.map((e) => Accomodation.fromJson(e)).toList();
  return AccomodationNotifier(accomodations);
});

var guide_provider = StateNotifierProvider<GuideNotifier, List<Guide>>((ref) {
  return GuideNotifier([
    Guide('test1', 'First', 'Best one so far!', [
      Event.fromJson(DummyData.events[0]),
      Place.fromJson(DummyData.places[0]),
      Place.fromJson(DummyData.places[1]),
      Accomodation.fromJson(DummyData.accomodation[1]),
    ]),
    Guide('test2', 'Second', 'Not so good one!', [
      Event.fromJson(DummyData.events[1]),
      Place.fromJson(DummyData.places[1]),
      Place.fromJson(DummyData.places[2]),
      Accomodation.fromJson(DummyData.accomodation[1]),
    ]),
    Guide('test3', 'Third', 'This one is ok!!', [
      Event.fromJson(DummyData.events[2]),
      Place.fromJson(DummyData.places[3]),
      Place.fromJson(DummyData.places[4]),
      Accomodation.fromJson(DummyData.accomodation[2]),
    ]),
  ]);
});
