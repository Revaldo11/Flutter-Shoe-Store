import 'package:myshoe/models/category_model.dart';
import 'package:myshoe/models/gallery_model.dart';

class ProductModel {
  late int id;
  late String name;
  late double price;
  late String description;
  late CategoryModel category;
  String? tags;
  late List<GalleryModel> galleries;
  late DateTime createdAt;
  late DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.galleries,
    this.tags,
    required this.createdAt,
    required this.updatedAt,
  });

  ProductModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromjson(gallery))
        .toList();
    tags = json['tags'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'category': category.tojson(),
      'galleries': galleries.map((gallery) => gallery.tojson()).toList(),
      'tags': tags,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
