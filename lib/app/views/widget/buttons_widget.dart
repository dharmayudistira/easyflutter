import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    required this.exerciseName,
    required this.isStart,
    required this.isAnswerTrue,
    required this.startExercise,
    required this.checkAnswer,
    required this.sendAnswer,
    required this.reset,
    Key? key,
  }) : super(key: key);

  final String exerciseName;
  final RxBool isStart;
  final RxBool isAnswerTrue;
  final Function startExercise;
  final Function checkAnswer;
  final Function sendAnswer;
  final Function reset;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return isStart.value
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildResetButton(context),
                SizedBox(width: 16.r),
                buildCheckAnswerButton(context),
                SizedBox(width: 16.r),
                buildSendAnswerButton(context),
              ],
            )
          : Container(
              width: double.infinity,
              child: buildStartExerciseButton(context),
            );
    });
  }

  Widget buildStartExerciseButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: CustomTextHelper.textTitleDialog(
                context: context,
                text: 'Apakah Anda yakin untuk mengerjakan $exerciseName?',
              ),
              content: Container(
                width: double.minPositive,
                child: CustomTextHelper.textBodyDialog(
                  context: context,
                  text:
                      'Lengkapi peta konsep menggunakan jawaban yang sudah disediakan, sesuai dengan output yang diharapkan. Ketika Anda menekan tombol "Yakin", maka waktu akan dimulai, dan waktu akan secara otomatis berhenti ketika Anda telah melengkapi peta konsep dengan benar.',
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
                    startExercise();
                    SnackBarHelper.showFlushbarInfo(
                        "Informasi", "Selamat mengerjakan.")
                      ..show(context);
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
      },
      child: CustomTextHelper.textBody(
        context: context,
        text: "Kerjakan Latihan",
        customColor: Colors.white,
      ),
    );
  }

  Widget buildSendAnswerButton(BuildContext context) {
    return Obx(
      () {
        return ElevatedButton(
          onPressed: isAnswerTrue.value
              ? () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: CustomTextHelper.textTitleDialog(
                            context: context,
                            text:
                                "Selamat Anda telah menyelesaikan $exerciseName",
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
                                sendAnswer();
                                Get.back();
                                Get.back();
                              },
                              child: CustomTextHelper.textBody(
                                context: context,
                                text: "Selesai",
                                customColor: Colors.white,
                              ),
                            ),
                          ],
                        );
                      });
                }
              : null,
          child: CustomTextHelper.textBody(
            context: context,
            text: "Kirim Jawaban",
            customColor: Colors.white,
          ),
        );
      },
    );
  }

  Widget buildCheckAnswerButton(BuildContext context) {
    return Obx(
      () {
        return ElevatedButton(
          onPressed: !isAnswerTrue.value
              ? () {
                  if (checkAnswer()) {
                    SnackBarHelper.showFlushbarSuccess(
                      "Selamat",
                      "Widget Tree yang Anda lengkapi telah sesuai dengan output yang diharapkan",
                    )..show(context);
                  } else {
                    SnackBarHelper.showFlushbarWarning(
                      "Mohon maaf",
                      "Widget Tree yang Anda lengkapi belum sesuai dengan output yang diharapkan",
                    )..show(context);
                  }
                }
              : null,
          child: CustomTextHelper.textBody(
            context: context,
            text: "Cek Jawaban",
            customColor: Colors.white,
          ),
        );
      },
    );
  }

  Widget buildResetButton(BuildContext context) {
    return Obx(
      () {
        return ElevatedButton(
          onPressed: !isAnswerTrue.value
              ? () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: CustomTextHelper.textTitleDialog(
                          context: context,
                          text:
                              'Apakah Anda yakin untuk reset jawaban latihan?',
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
                              reset();
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
                }
              : null,
          child: CustomTextHelper.textBody(
            context: context,
            text: "Reset",
            customColor: Colors.white,
          ),
        );
      },
    );
  }
}
