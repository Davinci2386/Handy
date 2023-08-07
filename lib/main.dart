import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testtest/views/screens/login_and_signup/login_view.dart';

void main(List<String> args) async {
  runApp(const Home());
}

// Future<bool> getstring() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? stringValue = prefs.getString('token') ?? "";
//   return await validate(
//       token: stringValue, url: 'https://handyclose.com/api/Auth/vladateToken');
// }

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: LoginView()));
  }
}


// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//         theme: ThemeData(primarySwatch: Colors.deepPurple),
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(body: LoginView()));
//   }
// }
