import 'package:flutter/material.dart';
import 'package:wallpapers/src/common/models/image.dart';
import 'package:wallpapers/src/features/screens/show_wallpaper/container/show_wallpaper_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap})
      : super(key: key);
  final List<ImageModel> list;
  final Function(String, ShowWallpaperArgs) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          final item = list[index];

          return InkWell(
            onTap: () => onItemTap(
              '/details',
              ShowWallpaperArgs(original: item.original),
            ),
            // child: Image.network(item.thumb),
            child: Ink.image(
              image: NetworkImage(item.thumb),
              width: 110,
              height: 110,
            ),
          );
        },
      ),
    );
  }
}
