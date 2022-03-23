class ImageModel {
  final String id;
  final String original;
  final String thumb;

  factory ImageModel.fromMap(Map<String, dynamic> json) {
    return ImageModel(
      original: json['path'],
      thumb: json['thumbs']['large'],
      id: json['id'],
    );
  }

  ImageModel({required this.id, required this.original, required this.thumb});
}
