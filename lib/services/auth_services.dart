/*File untuk meminta request dari backend
  File to request from backend
*/
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/users_model.dart';

class AuthService {
  String baseUrl = "https://myshoe-api.revaldoputra.my.id/api";

  Future<UserModel> register({
    @required name,
    @required username,
    @required email,
    @required password,
  }) async {
    var url = "$baseUrl/register";
    var headers = {
      "Content-Type": "application/json",
    };

    var body = json.encode({
      "name": name,
      "username": username,
      "email": email,
      "password": password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    debugPrint(response.body);

    if (response.statusCode == 200) {
      var data = json.decode(response.body)["data"];
      UserModel user = UserModel.fromJson(data["user"]);
      user.token = "Bearer " + data["access_token"];
      return user;
    } else {
      throw Exception("Gagal Register");
    }
  }
}
