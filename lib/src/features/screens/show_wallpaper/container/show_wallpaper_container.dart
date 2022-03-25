import 'package:flutter/material.dart';
import 'package:wallpapers/src/common/models/image.dart';
import 'package:wallpapers/src/common/repositories/image_repository.dart';
import 'package:wallpapers/src/features/screens/show_wallpaper/pages/show_wallpaper_page.dart';

class ShowWallpaperContainer extends StatelessWidget {
  const ShowWallpaperContainer({
    Key? key,
    required this.arguments,
    required this.repository,
  }) : super(key: key);

  final ImageRepository repository;
  final ImageModel arguments;

  @override
  Widget build(BuildContext context) {
    return ShowWallpaperPage(image: arguments);
  }
}
