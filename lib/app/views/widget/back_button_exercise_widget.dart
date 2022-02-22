import 'package:easyflutter/app/utils/custom_text_helper.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BackButtonExercise extends StatelessWidget {
  const BackButtonExercise({
    required this.isStart,
    Key? key,
  }) : super(key: key);

  final RxBool isStart;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (isStart.value) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: CustomTextHelper.textTitleDialog(
                  context: context,
                  text: 'Apakah Anda yakin untuk keluar?',
                ),
                content: Container(
                  width: double.minPositive,
                  child: CustomTextHelper.textBodyDialog(
                    context: context,
                    text:
                        'Jika Anda menekan tombol "Yakin" maka progres Anda pada latihan ini akan direset.!',
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
            },
          );
        } else {
          Get.back();
        }
      },
      icon: FaIcon(
        FontAwesomeIcons.angleLeft,
        color: Colors.black,
      ),
    );
  }
}
