import 'package:myshoe/models/product_model.dart';

class MessageModel {
  late String message;
  late int userId;
  late String userName;
  late String userImage;
  late bool isFromUser;
  late ProductModel product;
  late DateTime createdAt;
  late DateTime updatedAt;

  MessageModel({
    required this.message,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.isFromUser,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    userName = json['userName'];
    userImage = json['userImage'];
    isFromUser = json['isFromUser'];

    //cek apakah product null atau uninitialized
    product = json['product'].isEmpty
        ? UninitializedProductModel()
        : ProductModel.fromJson(json['product']);
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,

      /*
      cek apakah product uninitialized kalau iya maka return null, 
      kalau tidak maka return product.toJson()
      */
      'product': product is UninitializedProductModel ? {} : product.toJson(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
