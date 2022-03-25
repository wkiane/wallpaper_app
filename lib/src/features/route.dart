import 'package:flutter/material.dart';
import 'package:wallpapers/src/common/models/image.dart';
import 'package:wallpapers/src/common/repositories/image_repository.dart';
import 'package:wallpapers/src/features/screens/home/container/home_container.dart';
import 'package:wallpapers/src/features/screens/show_wallpaper/container/show_wallpaper_container.dart';

class AppRoute extends StatelessWidget {
  const AppRoute({Key? key, required this.repository}) : super(key: key);
  final ImageRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (context) {
                return HomeContainer(
                  repository: repository,
                  onItemTap: (route, arguments) {
                    Navigator.of(context)
                        .pushNamed(route, arguments: arguments);
                  },
                );
              });
            case '/details':
              return MaterialPageRoute(builder: (context) {
                return ShowWallpaperContainer(
                  repository: repository,
                  arguments: (settings.arguments) as ImageModel,
                );
              });
          }
        });
  }
}
