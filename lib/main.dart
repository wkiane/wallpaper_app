import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wallpapers/src/common/repositories/image_repository.dart';
import 'package:wallpapers/src/features/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpapers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppRoute(
        repository: ImageRepository(dio: Dio()),
      ),
    );
  }
}
