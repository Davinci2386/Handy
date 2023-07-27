import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
    String tocken = jsonDecode(response.body)['password'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', tocken);
    return true;
  } else {
    return false;
  }
}
