import 'package:flutter/material.dart';
import 'package:wallpapers/src/common/models/image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap})
      : super(key: key);
  final List<ImageModel> list;
  final Function(String, ImageModel) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cool Wallpapers'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          final item = list[index];
          return _image(item, onItemTap);
        },
      ),
    );
  }

  _image(item, onItemTap) {
    return GestureDetector(
      onTap: () => onItemTap('/details', item),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(item.thumb),
          ),
        ),
      ),
    );
  }
}
