// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesController on FavoritesControllerBase, Store {
  Computed<int>? _$favoritesCountComputed;

  @override
  int get favoritesCount =>
      (_$favoritesCountComputed ??= Computed<int>(() => super.favoritesCount,
              name: 'FavoritesControllerBase.favoritesCount'))
          .value;

  final _$favoritesAtom = Atom(name: 'FavoritesControllerBase.favorites');

  @override
  ObservableList<ImageModel> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<ImageModel> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  final _$FavoritesControllerBaseActionController =
      ActionController(name: 'FavoritesControllerBase');

  @override
  dynamic addOrRemoveFavorite(ImageModel image) {
    final _$actionInfo = _$FavoritesControllerBaseActionController.startAction(
        name: 'FavoritesControllerBase.addOrRemoveFavorite');
    try {
      return super.addOrRemoveFavorite(image);
    } finally {
      _$FavoritesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favorites: ${favorites},
favoritesCount: ${favoritesCount}
    ''';
  }
}
