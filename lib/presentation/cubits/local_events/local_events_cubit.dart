import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../domain/repositories/offline_repository.dart';
part 'local_events_state.dart';

class LocalEventsCubit extends Cubit<LocalEventsState> {
  final DatabaseRepository _databaseRepository;

  LocalEventsCubit(this._databaseRepository)
      : super(const LocalEventsSuccess(eventsID: []));

  Future<void> getAllFavoritesEvents() async {
    emit(await _getAllFavoritesEvents());
  }

  Future<void> unfavorite({required String id}) async {
    await _databaseRepository.unfavorite(id);
    emit(await _getAllFavoritesEvents());
  }

  Future<void> favorite({required String id}) async {
    await _databaseRepository.favorite(id);
    emit(await _getAllFavoritesEvents());
  }

  Future<LocalEventsState> _getAllFavoritesEvents() async {
    final eventsID = await _databaseRepository.getfavorites();
    return LocalEventsSuccess(eventsID: eventsID);
  }
}
