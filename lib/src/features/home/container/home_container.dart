import 'package:flutter/material.dart';
import 'package:wallpapers/src/common/errors/failure.dart';
import 'package:wallpapers/src/common/models/image.dart';
import 'package:wallpapers/src/common/repositories/image_repository.dart';
import 'package:wallpapers/src/features/home/pages/home_error.dart';
import 'package:wallpapers/src/features/home/pages/home_loading.dart';
import 'package:wallpapers/src/features/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);
  final ImageRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageModel>>(
      future: repository.getImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(list: snapshot.data!);
        }

        if (snapshot.hasError) {
          return HomeError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
