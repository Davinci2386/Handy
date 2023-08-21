import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<dynamic> getHistory() async {
  const storage = FlutterSecureStorage();
  storage.read(key: 'token');
  String? tokenn = await storage.read(key: 'token');

  String url = "https://handyclose.com/api/Pyament_info";
  final response =
      await http.get(Uri.parse(url), headers: {"Authorization": tokenn!});

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw "Error";
  }
}
