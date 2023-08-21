import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/timer_controller.dart';
import '../../../core/constant/app_colors.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  TimerController timerController = Get.put(TimerController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        timerController.restartTimer();
      },
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/homescreen.svg",
            ),
            const Column(
              children: [
                SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Text(
                            "Payment Application In Syria",
                            style: TextStyle(fontSize: 28, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Our purpose is your comfort. You can buy , pay in one application. Handy .. close to your Hand!!",
                            style: TextStyle(
                                color: AppColors.secondryText, fontSize: 18),
                          ),
                        ),
                      ],
                    )),
                Spacer(),
                Text(
                  "Welcome !",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
