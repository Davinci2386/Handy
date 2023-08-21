import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  static const int idleDuration = 60; // in seconds
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    resetTimer();
  }

  void resetTimer() {
    _timer = Timer(const Duration(seconds: idleDuration), () {
      Get.offAllNamed('/login'); // Navigate to login page
    });
  }

  void restartTimer() {
    _timer.cancel();
    resetTimer();
  }
}
