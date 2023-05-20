import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:katim_task/data/models/event_model.dart';
import 'package:katim_task/domain/usecases/get_events.dart';
part 'remote_events_state.dart';

class RemoteEventsCubit extends Cubit<RemoteEventsState> {
  final GetEvents _getEvents;

  RemoteEventsCubit(this._getEvents) : super(const RemoteEventsInit());

  Future<void> getEvents({required String sources}) async {
    emit(const RemoteEventsLoading());
    final response = await _getEvents.execute(
      sources,
    );

    response.fold((failure) => emit(RemoteEventsFailed(error: failure.message)),
        (data) {
      emit(RemoteEventsSuccess(events: data.events));
    });
  }

  Future<void> cancelSearch() async {
    emit(const RemoteEventsInit());
  }
}
