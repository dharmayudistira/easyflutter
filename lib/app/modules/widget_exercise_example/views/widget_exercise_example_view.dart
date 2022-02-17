import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/views/widget/back_button_exercise_widget.dart';
import 'package:easyflutter/app/views/widget/drag_target_widget.dart';
import 'package:easyflutter/app/views/widget/draggable_widget.dart';
import 'package:easyflutter/app/views/widget/stopwatch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';

import '../controllers/widget_exercise_example_controller.dart';

class WidgetExerciseExampleView extends StatelessWidget {
  WidgetExerciseExampleView({Key? key}) : super(key: key);

  final controller = Get.put(WidgetExerciseExampleController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowCaseWidget(
        builder: Builder(builder: (_) => WidgetExerciseExample()),
        onComplete: (p0, p1) {
          if (p0 == 7) {
            controller.startExercise();
          }
          if (p0 == 10) {
            Get.defaultDialog(
              title: "Selamat! Anda telah menyelesaikan Tutorial.",
              middleText:
                  "Kerjakan contoh soal berikut sebelum mengerjakan latihan soal. Semangat!",
            );
          }
        },
      ),
    );
  }
}

class WidgetExerciseExample extends StatefulWidget {
  WidgetExerciseExample({Key? key}) : super(key: key);

  @override
  State<WidgetExerciseExample> createState() => _WidgetExerciseExampleState();
}

class _WidgetExerciseExampleState extends State<WidgetExerciseExample> {
  final controller = Get.put(WidgetExerciseExampleController());
  final key1 = GlobalKey();
  final key2 = GlobalKey();
  final key3 = GlobalKey();
  final key4 = GlobalKey();
  final key5 = GlobalKey();
  final key6 = GlobalKey();
  final key7 = GlobalKey();
  final key8 = GlobalKey();
  final key9 = GlobalKey();
  final key10 = GlobalKey();
  final key11 = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 200), () {
        ShowCaseWidget.of(context)?.startShowCase([
          key1,
          key2,
          key3,
          key4,
          key5,
          key6,
          key7,
          key8,
          key9,
          key10,
          key11,
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1366, 768),
      builder: () {
        return Scaffold(
          appBar: AppBar(
            leading: BackButtonExercise(
              isStart: controller.isStart,
            ),
            title: CustomShowcaseWidget(
              globalKey: key1,
              description: "Berikut merupakan ID Latihan.",
              child: Text(
                "Latihan ID: ${controller.exerciseId}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: Colors.black),
              ),
            ),
            backgroundColor: ColorConstants.kPrimaryColor,
            elevation: 0,
          ),
          body: Container(
            color: Colors.grey.withOpacity(0.1),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 32.w,
                      top: 16.h,
                      right: 16.w,
                      bottom: 16.h,
                    ),
                    child: Card(
                      elevation: 8.r,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 24.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomShowcaseWidget(
                              globalKey: key2,
                              description: "Berikut merupakan Nama Latihan.",
                              child: Text(
                                controller.exerciseName,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(color: Colors.black),
                              ),
                            ),
                            CustomShowcaseWidget(
                              globalKey: key3,
                              description:
                                  "Berikut merupakan Deskripsi Latihan.",
                              child: Text(
                                controller.exerciseDescription,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(color: Colors.black),
                              ),
                            ),
                            CustomShowcaseWidget(
                              globalKey: key4,
                              description:
                                  "Berikut merupakan Concept Map (Widget Tree) dari ahli yang sudah dihilangkan beberapa bagian.",
                              child: Center(
                                child: Stack(
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          height: 420.h,
                                          child: Image.asset(
                                            "assets/images/widget/widget_tree0.png",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(height: 232.r),
                                        Row(
                                          children: [
                                            SizedBox(width: 298.3.h),
                                            DragTargetWidget(
                                              acceptAnswer:
                                                  controller.acceptAnswer,
                                              targetAnswers:
                                                  controller.targetAnswers,
                                              index: 0,
                                              size: 70,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 34.6.r),
                                        Row(
                                          children: [
                                            SizedBox(width: 193.6.h),
                                            DragTargetWidget(
                                              acceptAnswer:
                                                  controller.acceptAnswer,
                                              targetAnswers:
                                                  controller.targetAnswers,
                                              index: 1,
                                              size: 70,
                                            ),
                                            SizedBox(width: 139.5.h),
                                            DragTargetWidget(
                                              acceptAnswer:
                                                  controller.acceptAnswer,
                                              targetAnswers:
                                                  controller.targetAnswers,
                                              index: 2,
                                              size: 70,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomShowcaseWidget(
                              globalKey: key5,
                              description:
                                  "Berikut merupakan pilihan jawaban yang dapat digunakan mahasiswa untuk melengkapi Concept Map (Widget Tree) diatas.",
                              child: Center(
                                child: DraggableWidget(
                                  answerList: controller.answerList,
                                  size: 70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16.w,
                      top: 16.h,
                      right: 32.w,
                      bottom: 16.h,
                    ),
                    child: Card(
                      elevation: 8.r,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 24.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Output yang diharapkan",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(color: Colors.black),
                                ),
                                CustomShowcaseWidget(
                                  globalKey: key6,
                                  description:
                                      "Berikut merupakan waktu yang digunakan mahasiswa untuk menyelesaikan latihan.",
                                  child: StopWatchWidget(
                                    stopWatchTimer: controller.stopWatchTimer,
                                  ),
                                ),
                              ],
                            ),
                            CustomShowcaseWidget(
                              globalKey: key7,
                              description:
                                  "Berikut merupakan gambar output yang diharapkan dari Concept Map (Widget Tree).",
                              child: Center(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: SizedBox(
                                    height: 420.h,
                                    child: Image.asset(
                                      "assets/images/widget/latihan0.png",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(() {
                              return controller.isStart.value
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomShowcaseWidget(
                                          globalKey: key9,
                                          description:
                                              "Berikut merupakan tombol yang dapat digunakan untuk mengatur ulang Concept Map (Widget Tree) dan Pilihan Jawaban yang tersedia.",
                                          child: buildResetButton(context),
                                        ),
                                        SizedBox(width: 16.r),
                                        CustomShowcaseWidget(
                                          globalKey: key10,
                                          description:
                                              "Berikut merupakan tombol yang dapat digunakan untuk memeriksa apakah Concept Map (Widget Tree) sudah dilengkapi dengan benar.",
                                          child:
                                              buildCheckAnswerButton(context),
                                        ),
                                        SizedBox(width: 16.r),
                                        CustomShowcaseWidget(
                                          globalKey: key11,
                                          description:
                                              "Berikut merupakan tombol untuk menandakan bahwa latihan berhasil diselesaikan.",
                                          child: buildSendAnswerButton(context),
                                        ),
                                      ],
                                    )
                                  : CustomShowcaseWidget(
                                      globalKey: key8,
                                      description:
                                          "Berikut merupakan tombol untuk memulai latihan.",
                                      child: Container(
                                        width: double.infinity,
                                        child:
                                            buildStartExerciseButton(context),
                                      ),
                                    );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildStartExerciseButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Apakah Anda yakin untuk mengerjakan ${controller.exerciseName}?',
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
                    controller.startExercise();
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
          onPressed: controller.isAnswerTrue.value
              ? () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Selamat"),
                          content: Text(
                            "Anda telah menyelesaikan ${controller.exerciseName}",
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
          onPressed: !controller.isAnswerTrue.value
              ? () {
                  if (controller.checkAnswer()) {
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
          onPressed: !controller.isAnswerTrue.value
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
                              controller.reset();
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

class CustomShowcaseWidget extends StatelessWidget {
  final Widget child;
  final GlobalKey globalKey;
  final String description;

  const CustomShowcaseWidget({
    required this.child,
    required this.globalKey,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Showcase(
      child: child,
      key: globalKey,
      showcaseBackgroundColor: ColorConstants.kPrimaryColor,
      contentPadding: EdgeInsets.all(12),
      description: description,
      descTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      overlayPadding: EdgeInsets.all(8),
    );
  }
}
