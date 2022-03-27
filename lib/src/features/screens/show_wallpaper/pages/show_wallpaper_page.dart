import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wallpapers/src/common/models/image.dart';
import 'package:wallpapers/src/features/screens/favorites/controller/favorites_controller.dart';
import 'package:wallpapers/src/utils/toast.dart';

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
        ),
        body: Stack(
          children: [
            PhotoView.customChild(
              minScale: PhotoViewComputedScale.contained * 1.0,
              child: Image.network(
                image.original,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                loadingBuilder: _loadImage,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSetBgButton(context, image.original),
                    _buildFavButton(context)
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildFavButton(BuildContext context) {
    return Observer(builder: (_) {
      final isFav = favoritesController.isFavorite(image.id);
      final icon = isFav ? Icons.favorite : Icons.favorite_border;
      return OutlinedButton(
        onPressed: () => favoritesController.addOrRemoveFavorite(image),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const Text('Favorite', style: TextStyle(color: Colors.white)),
          ],
        ),
      );
    });
  }

  Widget _buildSetBgButton(BuildContext context, String url) {
    return OutlinedButton(
      onPressed: () async {
        showToast(context, 'Carregando...');
        int location = WallpaperManager.BOTH_SCREEN;
        var file = await DefaultCacheManager().getSingleFile(url);
        await WallpaperManager.setWallpaperFromFile(file.path, location);
        showToast(context, 'Background Atualizado com sucesso');
      },
      child: Column(
        children: const [
          Icon(
            Icons.wallpaper,
            color: Colors.white,
          ),
          Text('Set Background', style: TextStyle(color: Colors.white)),
        ],
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
