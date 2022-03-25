import 'package:dio/dio.dart';
import 'package:wallpapers/src/common/consts/api_consts.dart';
import 'package:wallpapers/src/common/errors/failure.dart';
import 'package:wallpapers/src/common/models/image.dart';

abstract class IImageRepository {
  Future<List<ImageModel>> getImages();
}

class ImageRepository implements IImageRepository {
  ImageRepository({required this.dio});
  final Dio dio;

  @override
  Future<List<ImageModel>> getImages() async {
    try {
      final url = '${ApiConsts.apiUrl}/search?purity=100&q=landscape';
      final response = await dio.get(url);
      final json = Map<String, dynamic>.from(response.data);
      final list = json['data'] as List<dynamic>;
      return list.map((e) => ImageModel.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: 'Não foi possível carregar os dados');
    }
  }
}
