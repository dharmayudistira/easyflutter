import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/data/dosen_model.dart';
import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:easyflutter/app/utils/validation_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {

  final GlobalKey<FormState> registerFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kPrimaryColor,
      body: Center(
        child: Container(
          width: Get.size.width * 0.65,
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
        padding:
            EdgeInsets.symmetric(horizontal: dimenLarge, vertical: dimenMedium),
        child: Form(
          key: registerFormKey,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                CustomTextHelper.textTitle(
                  context: context,
                  text: "Daftar Sebagai Mahasiswa",
                ),
                SizedBox(height: dimenMedium),
                TextFormField(
                  controller: controller.edtStudentIdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "1941720000",
                    label: CustomTextHelper.textLabelForm(
                      context: context,
                      text: "Masukkan NIM",
                    ),
                  ),
                  validator: (newValue) {
                    return emptyValidationForm(newValue, "NIM");
                  },
                ),
                SizedBox(height: dimenSmall),
                TextFormField(
                  controller: controller.edtStudentNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Masukkan Nama Anda",
                    label: CustomTextHelper.textLabelForm(
                      context: context,
                      text: "Masukkan Nama",
                    ),
                  ),
                  validator: (newValue) {
                    return emptyValidationForm(newValue, "nama mahasiswa");
                  },
                ),
                SizedBox(height: dimenSmall),
                Obx(() {
                  var passwordState = controller.isObscured.value;

                  return TextFormField(
                    controller: controller.edtStudentPasswordController,
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
                StreamBuilder(
                  stream: controller.getAllLecturer(),
                  builder: (_, AsyncSnapshot<QuerySnapshot> snapshots) {
                    if (snapshots.connectionState == ConnectionState.active) {
                      return _buildDropdownLecturer(snapshots, context);
                    } else {
                      return _buildDropdownDummyValue("Pilih Dosen", context);
                    }
                  },
                ),
                SizedBox(height: dimenSmall),
                Obx(() {
                  return (controller.isClassHidden.value)
                      ? Container()
                      : StreamBuilder(
                          stream: controller.getClassByLecturer(),
                          builder: (_, AsyncSnapshot<QuerySnapshot> snapshots) {
                            if (snapshots.hasData) {
                              if (snapshots.data!.docs.isNotEmpty) {
                                return _buildDropdownClass(snapshots, context);
                              } else {
                                return _buildDropdownDummyValue(
                                  "Pilih Kelas",
                                  context,
                                );
                              }
                            } else {
                              return _buildDropdownDummyValue(
                                "Pilih Kelas",
                                context,
                              );
                            }
                          },
                        );
                }),
                SizedBox(height: dimenMedium),
                Container(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      final isFormValid = registerFormKey.currentState?.validate();
                      controller.addStudent(context, isFormValid ?? false);
                    },
                    child: CustomTextHelper.textBody(
                      context: context,
                      text: "Daftar",
                      customColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: dimenSmall),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Sudah punya akun ? ",
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: Colors.black,
                          ),
                      children: [
                        TextSpan(
                          text: "Masuk di sini",
                          style:
                              Theme.of(context).textTheme.subtitle2?.copyWith(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.offNamed(Routes.LOGIN);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownLecturer(
    AsyncSnapshot<QuerySnapshot> snapshots,
    BuildContext context,
  ) {
    controller.mapLecturerFirestoreToLecturerModel(snapshots);

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
        child: Obx(() {
          return DropdownButton<LecturerModel>(
            isExpanded: true,
            value: controller.selectedLecturer.value,
            items: controller.listLecturer
                .map(
                  (lecturer) => DropdownMenuItem<LecturerModel>(
                    value: lecturer,
                    child: CustomTextHelper.textBody(
                      context: context,
                      text: lecturer.lecturerName!,
                    ),
                  ),
                )
                .toList(),
            onChanged: (selected) {
              final selectedLecturer = selected as LecturerModel;
              controller.selectedLecturer.value = selectedLecturer;

              if (controller.selectedLecturer.value.lecturerName ==
                  "Pilih Dosen") {
                controller.isClassHidden.value = true;
              } else {
                controller.isClassHidden.value = false;
              }
            },
          );
        }),
      ),
    );
  }

  Widget _buildDropdownDummyValue(
    String dummyValue,
    BuildContext context,
  ) {
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
          value: dummyValue,
          items: <String>[dummyValue]
              .map(
                (dummy) => DropdownMenuItem<String>(
                  value: dummy,
                  child: CustomTextHelper.textBody(
                    context: context,
                    text: dummy,
                  ),
                ),
              )
              .toList(),
          onChanged: (selected) {},
        ),
      ),
    );
  }

  Widget _buildDropdownClass(
    AsyncSnapshot<QuerySnapshot> snapshots,
    BuildContext context,
  ) {
    controller.mapClassFirestoreToClassModel(snapshots);

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
        child: Obx(() {
          return DropdownButton<String>(
            isExpanded: true,
            value: controller.selectedClass.value,
            items: controller.listClass
                .map(
                  (itemClass) => DropdownMenuItem<String>(
                    value: itemClass.className,
                    child: CustomTextHelper.textBody(
                      context: context,
                      text: itemClass.className!,
                    ),
                  ),
                )
                .toList(),
            onChanged: (selected) {
              controller.selectedClass.value = selected!;
            },
          );
        }),
      ),
    );
  }
}
