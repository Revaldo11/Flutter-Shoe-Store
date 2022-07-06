import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:myshoe/models/product_model.dart';
import 'package:myshoe/models/users_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addMessage({
    required UserModel user,
    required bool isFromUser,
    required String message,
    required ProductModel product,
  }) async {
    try {
      firestore.collection('messages').add({
        'userId': user.id,
        'message': message,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': isFromUser,
        'product': product is UnitializedProductModel ? {} : product.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then(
        (value) => debugPrint('Pesan Berhasil Terkirim'),
      );
    } catch (e) {
      throw Exception('Pesan Gagal Terkirim!');
    }
  }
}
