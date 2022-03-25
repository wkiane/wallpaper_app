import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wallpapers/src/common/models/image.dart';
import 'package:wallpapers/src/features/screens/favorites/controller/favorites_controller.dart';

class ShowWallpaperPage extends StatelessWidget {
  ShowWallpaperPage({Key? key, required this.image}) : super(key: key);
  final ImageModel image;
  final favoritesController = FavoritesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0x44000000),
        elevation: 0,
        actions: [
          IconButton(
            icon: Observer(builder: (_) {
              final isFav = favoritesController.favorites
                  .any((item) => item.id == image.id);
              final icon = isFav ? Icons.favorite : Icons.favorite_border;
              return Icon(icon);
            }),
            onPressed: () {
              favoritesController.addOrRemoveFavorite(image);
            },
          ),
        ],
      ),
      body: PhotoView.customChild(
        child: Image.network(
          image.original,
          alignment: Alignment.center,
          loadingBuilder: _loadImage,
        ),
      ),
    );
  }

  Widget _loadImage(
      BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }
}
