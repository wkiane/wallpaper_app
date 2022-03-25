import 'package:mobx/mobx.dart';
import 'package:wallpapers/src/common/models/image.dart';

part "favorites_controller.g.dart";

class FavoritesController = FavoritesControllerBase with _$FavoritesController;

abstract class FavoritesControllerBase with Store {
  @observable
  List<ImageModel> favorites = [];

  @action
  addOrRemoveFavorite(ImageModel image) {
    final favsCopy = favorites;

    var duplicated = favsCopy.any((item) => item.id == image.id);

    if (!duplicated) {
      favsCopy.add(image);
      favorites = favsCopy;
    } else {
      favsCopy.removeWhere((item) => item.id == image.id);
      favorites = favsCopy;
    }
  }
}
