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
  late DateTime? createdAt;
  late DateTime? updatedAt;

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

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    tags = json['tags'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'category': category.toJson(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      'tags': tags,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}

class UninitializedProductModel extends ProductModel {
  // UninitializedProductModel null constructor
  UninitializedProductModel({
    int? id,
    String? name,
    double? price,
    String? description,
    CategoryModel? category,
    List<GalleryModel>? galleries,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id ?? 0,
          name: name ?? '',
          price: price ?? 0,
          description: description ?? '',
          category: category ?? CategoryModel(id: 0, name: ''),
          galleries: galleries ?? [],
          createdAt: createdAt ?? DateTime.now(),
          updatedAt: updatedAt ?? DateTime.now(),
        );
}
