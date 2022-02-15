import 'package:easyflutter/app/constants/dimen_constants.dart';
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
      title: Text(
        "Apakah Anda yakin untuk mengerjakan $exerciseName ?",
        style: Theme.of(context)
            .textTheme
            .subtitle2
            ?.copyWith(color: Colors.black),
      ),
      content: Container(
        width: double.minPositive,
        child: Text(
          "Susunlah blok - blok kode yang sudah disediakan sesuai dengan output yang diharapkan. Ketika Anda menekan tombol \"Yakin\", maka waktu akan dimulai dan waktu akan secara otomatis berhenti ketika Anda telah menyusun blok kode dengan benar.",
          style: Theme.of(context).textTheme.caption,
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
      title: Text(
        "Selamat Anda telah menyelesaikan $exerciseName",
        style: Theme.of(context)
            .textTheme
            .subtitle2
            ?.copyWith(color: Colors.black),
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
          child: Text("Yakin"),
        ),
      ],
    );
  }

  static AlertDialog dialogBackExercise(
    BuildContext context,
    String exerciseName,
  ) {
    return AlertDialog(
      title: Text(
        "Apakah Anda yakin untuk keluar ?",
        style: Theme.of(context)
            .textTheme
            .subtitle2
            ?.copyWith(color: Colors.black),
      ),
      content: Container(
        width: double.minPositive,
        child: Text(
          "Saat ini Anda sedang mengerjakan $exerciseName. Jika Anda menekan tombol \"Yakin\", maka Anda akan keluar dari latihan ini.",
          style: Theme.of(context).textTheme.caption,
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
}
