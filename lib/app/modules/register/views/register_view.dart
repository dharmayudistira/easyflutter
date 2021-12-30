import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/views/app_description_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Container(
          width: Get.size.width * 0.6,
          height: Get.size.height * 0.8,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(dimenSmall),
            ),
            elevation: dimenSmall,
            child: Row(
              children: [
                _buildRegisterForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: dimenLarge, vertical: dimenMedium),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Daftar Sebagai Mahasiswa",
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
                  label: Text("Masukkan NIM"),
                ),
              ),
              SizedBox(height: dimenSmall),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukkan Nama Anda",
                  label: Text("Masukkan Nama"),
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
                      isExpanded: true,
                      value: controller.selectedLecturer.value,
                      items: controller.listLecturer
                          .map((lecturer) => DropdownMenuItem<String>(
                        value: lecturer,
                        child: Text(lecturer),
                      ))
                          .toList(),
                      onChanged: (selected) {
                        controller.selectedLecturer.value = selected!;
                      },
                    ),
                  ),
                );
              }),
              SizedBox(height: dimenSmall),
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
                      isExpanded: true,
                      value: controller.selectedClass.value,
                      items: controller.listClass
                          .map((itemClass) => DropdownMenuItem<String>(
                        value: itemClass,
                        child: Text(itemClass),
                      ))
                          .toList(),
                      onChanged: (selected) {
                        controller.selectedClass.value = selected!;
                      },
                    ),
                  ),
                );
              }),
              SizedBox(height: dimenMedium),
              Container(
                width: double.maxFinite,
                height: 35,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Daftar",
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
                      text: "Sudah punya akun ? ",
                      children: [
                        TextSpan(
                            text: "Masuk di sini",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offNamed(Routes.LOGIN);
                              }
                        ),
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
