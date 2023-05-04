import '../../domain/repositories/offline_repository.dart';
import '../datasource/offline/event_offline_datasource.dart';

class OfflineEventRepositoryImpl implements OfflineEventRepository {
  OfflineEventRepositoryImpl({required this.offlineDataSource});

  final OfflineDataSource offlineDataSource;

  @override
  Future<bool> favorite(String id) async {
    return offlineDataSource.favorite(id);
  }

  @override
  Future<bool> unfavorite(String id) async {
    return offlineDataSource.unfavorite(id);
  }

  @override
  Future<List<String>> getfavorites() async {
    return offlineDataSource.geFavoritEventsIDs();
  }
}
