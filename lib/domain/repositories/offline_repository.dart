//Repository
abstract class OfflineEventRepository {
  Future<void> favorite(String id);
  Future<void> unfavorite(String id);
  Future<List<String>> getfavorites();
}
