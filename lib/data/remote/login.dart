import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<bool> login(
    {required String email,
    required String password,
    required String url}) async {
  Map<String, String> m = {
    'content-type': 'application/json',
    'accept': '*/*',
  };
  http.Response response = await http.post(Uri.parse(url),
      body: jsonEncode({'email': email, 'password': password}), headers: m);

  if (response.statusCode == 200) {
    final storage = FlutterSecureStorage();
    String tocken = jsonDecode(response.body)['password'];
    await storage.write(key: 'token', value: tocken);
    String? tokenn = await storage.read(key: 'token');
    print(tokenn);
    return true;
  } else {
    return false;
  }
}
