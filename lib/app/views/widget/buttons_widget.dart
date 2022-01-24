import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    required this.exerciseName,
    required this.isStart,
    required this.isAnswerTrue,
    required this.startExercise,
    required this.checkAnswer,
    required this.reset,
    Key? key,
  }) : super(key: key);

  final String exerciseName;
  final RxBool isStart;
  final RxBool isAnswerTrue;
  final Function startExercise;
  final Function checkAnswer;
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
              title: Text(
                'Apakah Anda yakin untuk mengerjakan $exerciseName?',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              content: Container(
                width: double.minPositive,
                child: Text(
                  'Lengkapi peta konsep menggunakan jawaban yang sudah disediakan, sesuai dengan output yang diharapkan. Ketika Anda menekan tombol "Yakin", maka waktu akan dimulai, dan waktu akan secara otomatis berhenti ketika Anda telah melengkapi peta konsep dengan benar.',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Tidak'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    startExercise();
                    Get.snackbar("Informasi", "Selamat mengerjakan.");
                  },
                  child: Text('Yakin'),
                ),
              ],
            );
          },
        );
      },
      child: Text("Kerjakan Latihan"),
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
                          title: Text("Selamat"),
                          content: Text(
                            "Anda telah menyelesaikan $exerciseName",
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Get.back();
                                Get.back();
                              },
                              child: Text('Selesai'),
                            ),
                          ],
                        );
                      });
                }
              : null,
          child: Text(
            "Kirim Jawaban",
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: Colors.white),
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
                    Get.snackbar(
                      "Benar!",
                      "Selamat, jawaban Anda benar!",
                    );
                  } else {
                    Get.snackbar(
                      "Salah!",
                      "Maaf, jawaban Anda salah!",
                    );
                  }
                }
              : null,
          child: Text(
            "Check Jawaban",
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: Colors.white),
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
                        title: Text(
                          'Apakah Anda yakin untuk reset jawaban latihan?',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Tidak'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.redAccent,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                              reset();
                            },
                            child: Text('Yakin'),
                          ),
                        ],
                      );
                    },
                  );
                }
              : null,
          child: Text(
            "Reset",
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: Colors.white),
          ),
        );
      },
    );
  }
}
