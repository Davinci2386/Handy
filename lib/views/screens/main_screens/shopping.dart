import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/select_cat_controller.dart';
import '../../../controller/timer_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../widgets/category_card.dart';
import 'products_view.dart';

// ignore: must_be_immutable
class Shopping extends StatelessWidget {
  SelectCatController selectCatController = Get.put(SelectCatController());
  TimerController timerController = Get.put(TimerController());
  Shopping({Key? key}) : super(key: key);

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
              "All Categories",
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
                      image: const AssetImage(AppImages.phones),
                      text: const Text(
                        "Phones",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  onTap: () {
                    selectCatController.setCat("smartphones");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductsScreen(),
                        ));
                  },
                ),
                GestureDetector(
                  child: CategoryCard(
                      image: const AssetImage(AppImages.furniture),
                      text: const Text(
                        "Furniture",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  onTap: () {
                    selectCatController.setCat("furniture");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductsScreen(),
                        ));
                  },
                ),
                GestureDetector(
                  child: CategoryCard(
                      image: const AssetImage(AppImages.groceries),
                      text: const Text(
                        "Groceries",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  onTap: () {
                    selectCatController.setCat("groceries");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductsScreen(),
                        ));
                  },
                ),
                GestureDetector(
                  child: CategoryCard(
                      image: const AssetImage(AppImages.skincare),
                      text: const Text(
                        "Skin Care",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  onTap: () {
                    selectCatController.setCat("skincare");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductsScreen(),
                        ));
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
