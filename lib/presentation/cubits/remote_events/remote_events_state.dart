part of 'remote_events_cubit.dart';

abstract class RemoteEventsState extends Equatable {
  final List<EventModel> events;
  final String? error;

  const RemoteEventsState({
    this.events = const [],
    this.error,
  });

  @override
  List<Object?> get props => [events, error];
}

class RemoteEventsInit extends RemoteEventsState {
  const RemoteEventsInit();
}

class RemoteEventsLoading extends RemoteEventsState {
  const RemoteEventsLoading();
}

class RemoteEventsSuccess extends RemoteEventsState {
  const RemoteEventsSuccess({super.events});
}

class RemoteEventsFailed extends RemoteEventsState {
  const RemoteEventsFailed({super.error});
}
