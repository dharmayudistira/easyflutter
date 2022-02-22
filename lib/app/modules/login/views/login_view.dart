import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
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
          width: Get.size.width * 0.65,
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
            controller: ScrollController(),
            child: Column(
              children: [
                CustomTextHelper.textTitle(
                  context: context,
                  text: "Masuk",
                ),
                SizedBox(height: dimenMedium),
                TextFormField(
                  controller: controller.edtControllerId,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "1941720000",
                    label: CustomTextHelper.textLabelForm(
                      context: context,
                      text: "Masukkan NIM / NIDN",
                    ),
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
                      label: CustomTextHelper.textLabelForm(
                        context: context,
                        text: "Masukkan Kata Sandi",
                      ),
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
                    CustomTextHelper.textBody(
                      context: context,
                      text: "Masuk sebagai : ",
                    ),
                    SizedBox(width: dimenSmall),
                    Obx(() {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: dimenSmall / 2),
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
                                .map(
                                  (type) => DropdownMenuItem<String>(
                                    value: type,
                                    child: CustomTextHelper.textBody(
                                      context: context,
                                      text: type,
                                    ),
                                  ),
                                )
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
                  child: ElevatedButton(
                    onPressed: () {
                      controller.login(context);
                    },
                    child: CustomTextHelper.textBody(
                      context: context,
                      text: "Masuk",
                      customColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: dimenSmall),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: "Bagi mahasiswa silahkan daftar ",
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              color: Colors.black,
                            ),
                        children: [
                          TextSpan(
                            text: "di sini",
                            style:
                                Theme.of(context).textTheme.subtitle2?.copyWith(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offNamed(Routes.REGISTER);
                              },
                          ),
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
