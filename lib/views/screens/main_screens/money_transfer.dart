import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testtest/core/constant/app_colors.dart';
import 'package:testtest/data/remote/pay_for_transfer.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class MoneyTransfer extends StatefulWidget {
  const MoneyTransfer({Key? key}) : super(key: key);

  @override
  State<MoneyTransfer> createState() => _MoneyTransferState();
}

class _MoneyTransferState extends State<MoneyTransfer> {
  TextStyle textStyle = const TextStyle(fontSize: 24, color: Colors.white);

  GlobalKey<FormState> formkey = GlobalKey();

  int? accountnum;

  double? amount;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Form(
          key: formkey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Transfer Money",
              style: textStyle,
            ),
            const Spacer(
              flex: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Enter the account number",
              style: textStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  accountnum = int.parse(value);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is requierd';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    fillColor: Colors.white, filled: true),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Enter the amount you want to pay",
              style: textStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  amount = double.parse(value);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is requierd';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        FaIcon(FontAwesomeIcons.dollarSign),
                      ],
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                if (formkey.currentState!.validate()) {
                  isloading = true;
                  setState(() {});
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  String? stringValue = prefs.getString('token');
                  dynamic payurl = await payfortransfer(
                      accountid: accountnum!,
                      type: "transfer",
                      amount: amount!,
                      token: stringValue!,
                      url: "https://handyclose.com/api/Payment");
                  await launchUrl(Uri.parse(payurl as String));
                  isloading = false;
                  setState(() {});
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: 35,
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ]),
        ),
      ),
    );
  }
}
