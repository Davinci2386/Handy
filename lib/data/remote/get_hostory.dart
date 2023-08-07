import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testtest/core/class/models/product.dart';

Future<dynamic> getHistory() async {
  String url = "https://handyclose.com/api/Pyament_info";
  final response = await http.get(Uri.parse(url), headers: {
    "Authorization":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxNCIsIm5iZiI6MTY5MTA2NDQ2NCwiZXhwIjoxNjkxMzIzNjY0LCJpYXQiOjE2OTEwNjQ0NjR9.kqBNR-QBsuVBL5L3DxSr26VJ99NHmbeuNxLtj-0d4j8"
  });

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw "Error";
  }
}
