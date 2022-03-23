import 'package:flutter/material.dart';
import 'package:wallpapers/src/common/models/image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list}) : super(key: key);
  final List<ImageModel> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(list[index].thumb);
        },
      ),
    );
  }
}
