import '../../domain/repositories/offline_repository.dart';
import '../datasource/offline/event_offline_datasource.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  DatabaseRepositoryImpl({required this.offlineDataSource});

  final OfflineDataSource offlineDataSource;

  @override
  Future<void> favorite(String id) async {
    return offlineDataSource.favorite(id);
  }

  @override
  Future<void> unfavorite(String id) async {
    return offlineDataSource.unfavorite(id);
  }

  @override
  Future<List<String>> getfavorites() async {
    return offlineDataSource.geFavoritEventsIDs();
  }
}
