import 'package:city_guide_app/providers/event_provider.dart';
import 'package:riverpod/riverpod.dart';

var events_provider = StateNotifierProvider<EventsNotifier, List<Event>>((ref) {
  
  return EventsNotifier([]);
});