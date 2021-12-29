import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/views/app_description_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Container(
          width: Get.size.width * 0.6,
          height: Get.size.height * 0.7,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(dimenSmall),
            ),
            elevation: dimenSmall,
            child: Row(
              children: [
                AppDescriptionWidget(),
                VerticalDivider(),
                _buildLoginForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: dimenSmall, vertical: dimenMedium),
        child: Column(
          children: [
            Text(
              "Masuk",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.black),
            ),
            SizedBox(height: dimenMedium),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "1941720000",
                label: Text("Masukkan NIM / NIDN"),
              ),
            ),
            SizedBox(height: dimenSmall),
            Obx(() {
              var passwordState = controller.isObscured.value;

              return TextFormField(
                obscureText: passwordState,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "********",
                  suffixIcon: IconButton(
                    icon: (passwordState)
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      controller.setObscuredPassword();
                    },
                  ),
                  label: Text("Masukkan Kata Sandi"),
                ),
              );
            }),
            SizedBox(height: dimenSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Masuk sebagai : ",
                ),
                SizedBox(width: dimenSmall),
                Obx(() {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: dimenSmall / 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: controller.selectedLoginType.value,
                        items: controller.listLoginType
                            .map((type) => DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(type),
                                ))
                            .toList(),
                        onChanged: (selected) {
                          controller.selectedLoginType.value = selected!;
                        },
                      ),
                    ),
                  );
                }),
              ],
            ),
            SizedBox(height: dimenMedium),
            Container(
              width: double.maxFinite,
              height: 35,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Masuk",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: dimenSmall),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Bagi mahasiswa silahkan daftar ",
                  children: [
                    TextSpan(
                      text: "di sini",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //TODO : should navigate to register screen
                        }
                    ),
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
