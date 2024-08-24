import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Map<String, String>> _favorites = [];

  List<Map<String, String>> get favorites => _favorites;

  void toggleFavorite(String img_url, String name, String text) {
    final existingIndex = _favorites.indexWhere(
        (item) => item['img_url'] == img_url && item['name'] == name);
    if (existingIndex >= 0) {
      _favorites.removeAt(existingIndex);
    } else {
      _favorites.add({
        'img_url': img_url,
        'name': name,
        'text': text,
      });
    }
    notifyListeners();
  }

  bool isFavorited(String img_url, String name) {
    return _favorites
        .any((item) => item['img_url'] == img_url && item['name'] == name);
  }
}
