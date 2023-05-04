import 'package:equatable/equatable.dart';
import 'package:katim_task/data/models/event_model.dart';
import '../../../domain/repositories/online_repository.dart';
import '../base/base_cubit.dart';
part 'remote_events_state.dart';

class RemoteEventsCubit extends BaseCubit<RemoteEventsState, List<Events>> {
  final OnlineEventRepository _apiRepository;

  RemoteEventsCubit(this._apiRepository) : super(const RemoteEventsInit(), []);

  Future<void> getEvents({required String sources}) async {
    if (isBusy) return;

    emit(const RemoteEventsLoading());
    final response = await _apiRepository.getEvents(
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
