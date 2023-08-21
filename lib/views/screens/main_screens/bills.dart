import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/select_cat_controller.dart';
import '../../../controller/timer_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../widgets/category_card.dart';
import 'bill_payment.dart';

// ignore: must_be_immutable
class Bills extends StatelessWidget {
  SelectCatController2 selectCatController2 = Get.put(SelectCatController2());
  TimerController timerController = Get.put(TimerController());
  Bills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        timerController.restartTimer();
      },
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Bills",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
                child: GridView(
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              children: [
                GestureDetector(
                  child: CategoryCard(
                    image: const AssetImage(AppImages.electric),
                    text: const Text(
                      "Electricity",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    selectCatController2.setCat("Elictricity");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BillPayment(),
                        ));
                  },
                ),
                GestureDetector(
                  child: CategoryCard(
                    image: const AssetImage(AppImages.water),
                    text: const Text(
                      "Water",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    selectCatController2.setCat("Water");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BillPayment(),
                        ));
                  },
                ),
                GestureDetector(
                  child: CategoryCard(
                    image: const AssetImage(AppImages.telephone),
                    text: const Text(
                      "Telephone",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    selectCatController2.setCat("Telephone");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BillPayment(),
                        ));
                  },
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
