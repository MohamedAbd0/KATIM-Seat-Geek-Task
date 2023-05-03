part of 'local_events_cubit.dart';

abstract class LocalEventsState {
  final List<String> eventsID;

  const LocalEventsState({
    this.eventsID = const [],
  });

  List<Object> get props => [eventsID];
}

class LocalEventsSuccess extends LocalEventsState {
  const LocalEventsSuccess({super.eventsID});
}
