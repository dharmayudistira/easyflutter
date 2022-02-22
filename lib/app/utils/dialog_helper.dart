import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DialogHelper {
  static AlertDialog dialogStartExercise(
    BuildContext context,
    String exerciseName,
    String dialogMessage,
    Function onDialogStartSuccess,
  ) {
    return AlertDialog(
      title: CustomTextHelper.textTitleDialog(
        context: context,
        text: "Apakah Anda yakin untuk mengerjakan $exerciseName ?",
      ),
      content: Container(
        width: double.minPositive,
        child: CustomTextHelper.textBodyDialog(
          context: context,
          text: dialogMessage,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: CustomTextHelper.textBody(
            context: context,
            text: "Tidak",
            customColor: Colors.red,
          ),
        ),
        TextButton(
          onPressed: () {
            onDialogStartSuccess();
            SnackBarHelper.showFlushbarInfo(
              "Informasi",
              "Selamat mengerjakan $exerciseName",
            )..show(context);
          },
          child: CustomTextHelper.textBody(
            context: context,
            text: "Yakin",
            customColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  static AlertDialog dialogSendAnswerExercise(
    BuildContext context,
    String exerciseName,
  ) {
    return AlertDialog(
      title: CustomTextHelper.textTitleDialog(
        context: context,
        text: "Selamat, Anda telah menyelesaikan $exerciseName",
      ),
      content: Container(
        width: double.minPositive,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              "assets/animations/success_animation.json",
              height: 150,
              width: 150,
              repeat: false,
            ),
            SizedBox(height: dimenSmall),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: CustomTextHelper.textBody(
            context: context,
            text: "OK",
            customColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  static AlertDialog dialogBackExercise(
    BuildContext context,
    String exerciseName,
  ) {
    return AlertDialog(
      title: CustomTextHelper.textTitleDialog(
        context: context,
        text: "Apakah Anda yakin untuk keluar dari $exerciseName ?",
      ),
      content: Container(
        width: double.minPositive,
        child: CustomTextHelper.textBodyDialog(
          context: context,
          text:
              "Jika Anda menekan tombol \"Yakin\", maka Anda akan keluar dari latihan ini.",
          customAlignment: TextAlign.center,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: CustomTextHelper.textBody(
            context: context,
            text: "Tidak",
            customColor: Colors.red,
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: CustomTextHelper.textBody(
            context: context,
            text: "Yakin",
            customColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  static AlertDialog dialogEndTutorial(BuildContext context) {
    return AlertDialog(
      title: CustomTextHelper.textTitleDialog(
        context: context,
        text: "Selamat, tutorial pengerjaan latihan soal sudah selesai",
      ),
      content: Container(
        width: double.minPositive,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextHelper.textBodyDialog(
              context: context,
              text:
                  "Cobalah contoh soal berikut sebelum mengerjakan latihan soal",
              customAlignment: TextAlign.center,
            ),
            Lottie.asset(
              "assets/animations/success_animation.json",
              height: 150,
              width: 150,
              repeat: false,
            ),
            SizedBox(height: dimenSmall),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: CustomTextHelper.textBody(
            context: context,
            text: "OK",
            customColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
