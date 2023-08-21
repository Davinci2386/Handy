import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/screens/login_and_signup/login_view.dart';

import 'views/screens/login_and_signup/signup_view.dart';

void main(List<String> args) async {
  runApp(const Home());
}

// Future<bool> getstring() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? stringValue = prefs.getString('token') ?? "";
//   return await validate(
//       token: stringValue, url: 'https://handyclose.com/api/Auth/vladateToken');
// }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      title: 'Idle Timer Example',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SignUp()),
        GetPage(name: '/login', page: () => const LoginView()),
      ],
      home: const SignUp(),
    );
  }
}
