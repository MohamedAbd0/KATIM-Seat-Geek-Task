import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:katim_task/domain/usecases/favorites.dart';
part 'local_events_state.dart';

class LocalEventsCubit extends Cubit<LocalEventsState> {
  final Favorits _favorits;

  LocalEventsCubit(this._favorits)
      : super(const LocalEventsSuccess(eventsID: []));

  Future<void> getAllFavoritesEvents() async {
    emit(await _getAllFavoritesEvents());
  }

  Future<void> unfavorite({required String id}) async {
    await _favorits.unfavorite(id);
    emit(await _getAllFavoritesEvents());
  }

  Future<void> favorite({required String id}) async {
    await _favorits.favorite(id);
    emit(await _getAllFavoritesEvents());
  }

  Future<LocalEventsState> _getAllFavoritesEvents() async {
    final eventsID = await _favorits.getfavorites();
    return LocalEventsSuccess(eventsID: eventsID);
  }
}
