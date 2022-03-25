import 'package:flutter/material.dart';
import 'package:wallpapers/src/common/errors/failure.dart';
import 'package:wallpapers/src/common/models/image.dart';
import 'package:wallpapers/src/common/repositories/image_repository.dart';
import 'package:wallpapers/src/common/widgets/po_error.dart';
import 'package:wallpapers/src/common/widgets/po_loading.dart';
import 'package:wallpapers/src/features/screens/home/pages/home_page.dart';
import 'package:wallpapers/src/features/screens/show_wallpaper/container/show_wallpaper_container.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);
  final ImageRepository repository;
  final Function(String, ShowWallpaperArgs) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageModel>>(
      future: repository.getImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PoLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(list: snapshot.data!, onItemTap: onItemTap);
        }

        if (snapshot.hasError) {
          return PoError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
