import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/validation_helper.dart';
import 'package:easyflutter/app/views/app_description_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kPrimaryColor,
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
        child: Form(
          key: controller.loginFormKey,
          child: SingleChildScrollView(
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
                  controller: controller.edtControllerId,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "1941720000",
                    label: Text("Masukkan NIM / NIDN",),
                    prefixIcon: Icon(
                      FontAwesomeIcons.userAlt,
                      size: dimenSmall * 1.2,
                    ),
                  ),
                  validator: (newValue) {
                    return emptyValidationForm(newValue, "ID");
                  },
                ),
                SizedBox(height: dimenSmall),
                Obx(() {
                  var passwordState = controller.isObscured.value;

                  return TextFormField(
                    controller: controller.edtControllerPassword,
                    obscureText: passwordState,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "********",
                      prefixIcon: Icon(
                        FontAwesomeIcons.lock,
                        size: dimenSmall * 1.2,
                      ),
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
                    validator: (newValue) {
                      return emptyValidationForm(newValue, "kata sandi");
                    },
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
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
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
                                  Get.offNamed(Routes.REGISTER);
                                }),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
