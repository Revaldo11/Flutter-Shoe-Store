class GalleryModel {
  late int id;
  late String url;

  GalleryModel({required this.id, required this.url});

  GalleryModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'url': url,
    };
  }
}
