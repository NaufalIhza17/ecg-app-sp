import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  var favoriteMenus = [];
  var temporaryFavoriteMenus = [];

  var allMenus = [];

  Map<String, List> allMenusTest = {
    'Top Up': [],
    'Pendaftaran': [],
    'Tagihan': [],
  };

  bool isFavoriteFull = false;
  int maxFavorites = 5;

  void toggleFavoriteMenu(menu) {
    if (temporaryFavoriteMenus.contains(menu)) {
      temporaryFavoriteMenus.remove(menu);
      isFavoriteFull = !(temporaryFavoriteMenus.length < maxFavorites);
    } else {
      isFavoriteFull = !(temporaryFavoriteMenus.length < maxFavorites);
      if (!isFavoriteFull) {
        temporaryFavoriteMenus.add(menu);
      }
    }
    notifyListeners();
  }

  bool isEditFavoriteMenu = false;

  void toggleEditFavoriteMenu() {
    if (isEditFavoriteMenu) {
      // saving the new favorites
      isEditFavoriteMenu = false;
      favoriteMenus = [...temporaryFavoriteMenus];
    } else {
      isFavoriteFull = !(favoriteMenus.length < maxFavorites);
      isEditFavoriteMenu = true;
      temporaryFavoriteMenus = [...favoriteMenus];
    }
    notifyListeners();
  }

  void resetEditFavoritMenu() {
    isEditFavoriteMenu = false;
    notifyListeners();
  }
}
