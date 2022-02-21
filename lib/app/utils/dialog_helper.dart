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
          text:
              "Susunlah blok - blok kode yang sudah disediakan sesuai dengan output yang diharapkan. Ketika Anda menekan tombol \"Yakin\", maka waktu akan dimulai dan waktu akan secara otomatis berhenti ketika Anda telah menyusun blok kode dengan benar.",
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Tidak",
            style: TextStyle(
              color: Colors.redAccent,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onDialogStartSuccess();
            SnackBarHelper.showFlushbarInfo("Informasi", "Selamat mengerjakan.")
              ..show(context);
          },
          child: Text("Yakin"),
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
        text: "Selamat Anda telah menyelesaikan $exerciseName",
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
          child: Text("OK"),
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
        text: "Apakah Anda yakin untuk keluar ?",
      ),
      content: Container(
        width: double.minPositive,
        child: CustomTextHelper.textBodyDialog(
          context: context,
          text:
              "Saat ini Anda sedang mengerjakan $exerciseName. Jika Anda menekan tombol \"Yakin\", maka Anda akan keluar dari latihan ini.",
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Tidak",
            style: TextStyle(
              color: Colors.redAccent,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: Text("Yakin"),
        ),
      ],
    );
  }

  static AlertDialog dialogEndTutorial(BuildContext context) {
    return AlertDialog(
      title: CustomTextHelper.textTitleDialog(
        context: context,
        text: "Selamat! Tutorial pengerjaan latihan soal sudah selesai\nAnda dapat melanjutkan mengerjakan latihan soal ini sebagai latihan.",
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
          },
          child: Text("OK"),
        ),
      ],
    );
  }
}
