part of 'local_events_cubit.dart';

abstract class LocalEventsState extends Equatable {
  final List<String> eventsID;

  const LocalEventsState({
    this.eventsID = const [],
  });
  @override
  List<Object> get props => [eventsID];
}

class LocalEventsSuccess extends LocalEventsState {
  const LocalEventsSuccess({super.eventsID});
}
