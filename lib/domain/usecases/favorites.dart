import '../repositories/offline_repository.dart';

class Favorits {
  final OfflineEventRepository _offlineEventRepository;

  Favorits(this._offlineEventRepository);

  Future<List<String>> getfavorites() => _offlineEventRepository.getfavorites();

  Future<void> favorite(id) => _offlineEventRepository.favorite(id);
  Future<void> unfavorite(id) => _offlineEventRepository.unfavorite(id);
}
