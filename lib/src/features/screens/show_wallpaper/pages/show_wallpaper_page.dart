import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ShowWallpaperPage extends StatelessWidget {
  const ShowWallpaperPage({Key? key, required this.original}) : super(key: key);
  final String original;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0x44000000),
        elevation: 0,
      ),
      body: PhotoView.customChild(
        child: Image.network(
          original,
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
