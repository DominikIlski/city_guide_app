import 'package:city_guide_app/providers/accomodation_provider.dart';
import 'package:city_guide_app/providers/event_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../data/dummy_data.dart';

import 'package:firebase_auth/firebase_auth.dart';

var auth = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

var authStateProv = StreamProvider<User?>((ref) {
  return ref.read(auth).authStateChanges();
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
