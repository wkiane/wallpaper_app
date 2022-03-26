import 'package:mobx/mobx.dart';
import 'package:wallpapers/src/common/models/image.dart';

part "favorites_controller.g.dart";

class FavoritesController = FavoritesControllerBase with _$FavoritesController;

abstract class FavoritesControllerBase with Store {
  @computed
  int get favoritesCount => favorites.length;

  // --------------- favorites list ---------------------- //
  @observable
  ObservableList<ImageModel> favorites = ObservableList<ImageModel>.of([]);
  @action
  addOrRemoveFavorite(ImageModel image) {
    var duplicated = favorites.any((item) => item.id == image.id);
    !duplicated
        ? favorites.add(image)
        : favorites.removeWhere((item) => item.id == image.id);
    // final List<String> favoritesToDB = favorites.map((fav) => jsonEncode(fav.toJson())).toList();
  }
  // --------------- favorites list ---------------------- //

  // helpers
  isFavorite(String id) {
    return favorites.any((item) => item.id == id);
  }
}
