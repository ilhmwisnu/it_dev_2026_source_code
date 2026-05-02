import 'dart:convert';

import 'package:day_three_integrate_backend/models/user.dart';
import 'package:http/http.dart' as http;

class AppService {
  static String url = "https://dumpi.vercel.app";
  String? token;

  Future<void> login({required String email, required String password}) async {
    final res = await http.post(
      Uri.parse("$url/api/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (res.statusCode >= 200 && res.statusCode < 300) {
      final data = jsonDecode(res.body);
      token = data["token"];
      return;
    }

    throw Exception(jsonDecode(res.body)["message"]);
  }

  Future<void> register({
    required String email,
    required String password,
    required String confirmationPassword,
  }) async {
    final res = await http.post(
      Uri.parse("$url/api/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
        "confirmation_password": confirmationPassword,
      }),
    );

    if (res.statusCode >= 200 && res.statusCode < 300) {
      final data = jsonDecode(res.body);
      token = data["token"];
      return;
    }

    throw Exception(jsonDecode(res.body)["message"]);
  }

  Future<List<UserData>> getUsers() async {
    final uri = Uri.parse(
      "$url/api/users",
    ).replace(queryParameters: {"page": "1", "limit": "12"});

    final res = await http.get(uri);

    if (res.statusCode >= 200 && res.statusCode < 300) {
      final data = jsonDecode(res.body)["data"] as List<dynamic>;
      return data
          .map(
            (u) => UserData(
              id: u["id"],
              name: u["name"],
              email: u["email"],
              avatar: u["avatar"],
            ),
          )
          .toList();
    }

    throw jsonDecode(res.body)["message"];
  }
}

final service = AppService();

void main(List<String> args) async {
  try {
    final data = await service.getUsers();
    print(data);
  } catch (e) {
    print(e);
  }
}
