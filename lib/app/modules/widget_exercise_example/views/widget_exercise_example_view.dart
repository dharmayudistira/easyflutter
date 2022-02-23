import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:easyflutter/app/utils/dialog_helper.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
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
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return DialogHelper.dialogEndTutorial(context);
              },
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
            centerTitle: false,
            leading: BackButtonExercise(
              isStart: controller.isStart,
              exerciseName: controller.exerciseName,
            ),
            title: CustomShowcaseWidget(
              globalKey: key1,
              description: "Berikut merupakan ID Latihan.",
              child: CustomTextHelper.textBody(
                context: context,
                text: "Latihan ID: ${controller.exerciseId}",
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
                              child: CustomTextHelper.textBody(
                                context: context,
                                text: controller.exerciseName,
                                customWeight: FontWeight.bold,
                              ),
                            ),
                            CustomShowcaseWidget(
                              globalKey: key3,
                              description:
                                  "Berikut merupakan Deskripsi Latihan.",
                              child: CustomTextHelper.textCaption(
                                context: context,
                                text: controller.exerciseDescription,
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
                                              targetAnswer:
                                                  controller.targetAnswer,
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
                                              targetAnswer:
                                                  controller.targetAnswer,
                                              index: 1,
                                              size: 70,
                                            ),
                                            SizedBox(width: 139.5.h),
                                            DragTargetWidget(
                                              acceptAnswer:
                                                  controller.acceptAnswer,
                                              targetAnswer:
                                                  controller.targetAnswer,
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
                                CustomTextHelper.textBody(
                                  context: context,
                                  text: "Output yang diharapkan :",
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
            return DialogHelper.dialogStartExercise(
              context,
              controller.exerciseName,
              controller.dialogMessage,
              controller.startExercise,
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
          onPressed: controller.isAnswerTrue.value
              ? () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return DialogHelper.dialogSendAnswerExercise(
                        context,
                        controller.exerciseName,
                      );
                    },
                  );
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
          onPressed: !controller.isAnswerTrue.value
              ? () {
                  if (controller.checkAnswer()) {
                    SnackBarHelper.showFlushbarSuccess(
                      "Selamat",
                      "Widget Tree yang Anda lengkapi telah sesuai dengan output yang diharapkan",
                    )..show(context);
                  } else {
                    SnackBarHelper.showFlushbarWarning(
                      "Peringatan",
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
          onPressed: !controller.isAnswerTrue.value
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
                              controller.reset();
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
