import '../../../domain/service/shared_pref.dart';

abstract class OfflineDataSource {
  Future<List<String>> geFavoritEventsIDs();
  Future<void> favorite(String id);
  Future<void> unfavorite(String id);
}

class OfflineDataSourceImpl implements OfflineDataSource {
  OfflineDataSourceImpl();

  final String _favoriteKey = 'favoriteIDs';

  @override
  Future<List<String>> geFavoritEventsIDs() async {
    if (prefs.containsKey(_favoriteKey)) {
      return prefs.getStringList(_favoriteKey)!;
    } else {
      return [];
    }
  }

  @override
  Future<void> favorite(String id) async {
    List<String> ids = [];
    if (prefs.containsKey(_favoriteKey)) {
      ids = prefs.getStringList(_favoriteKey)!;
    }
    ids.add(id);
    prefs.setStringList(_favoriteKey, ids);
  }

  @override
  Future<void> unfavorite(String id) async {
    List<String> ids = [];
    if (prefs.containsKey(_favoriteKey)) {
      ids = prefs.getStringList(_favoriteKey)!;
    }
    ids.remove(id);
    prefs.setStringList(_favoriteKey, ids);
  }
}
