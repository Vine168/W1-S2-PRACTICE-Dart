import 'package:flutter/foundation.dart';

class FavoritesManager extends ChangeNotifier {
  final ValueNotifier<List<Map<String, dynamic>>> _favoritesNotifier =
      ValueNotifier<List<Map<String, dynamic>>>([]);

  ValueNotifier<List<Map<String, dynamic>>> get favoritesNotifier =>
      _favoritesNotifier;

  List<Map<String, dynamic>> get favoriteSongs => _favoritesNotifier.value;

  void addFavorite(Map<String, dynamic> song) {
    if (!_favoritesNotifier.value.contains(song)) {
      _favoritesNotifier.value = [..._favoritesNotifier.value, song];
    }
  }

  void removeFavorite(Map<String, dynamic> song) {
    _favoritesNotifier.value =
        _favoritesNotifier.value.where((s) => s != song).toList();
  }

  bool isFavorite(Map<String, dynamic> song) {
    return _favoritesNotifier.value.contains(song);
  }
}

// Create a global instance of FavoritesManager
final favoritesManager = FavoritesManager();
