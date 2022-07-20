import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:easyflutter/app/utils/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../controllers/code_exercise_example_controller.dart';

class CodeExerciseExampleView extends StatefulWidget {
  @override
  State<CodeExerciseExampleView> createState() =>
      _CodeExerciseExampleViewState();
}

class _CodeExerciseExampleViewState extends State<CodeExerciseExampleView> {
  final controller = Get.put(CodeExerciseExampleController());
  final keyButtonBack = GlobalKey();
  final keyAppbarTitle = GlobalKey();
  final keyExerciseName = GlobalKey();
  final keyExerciseCaption = GlobalKey();
  final keyReorderables = GlobalKey();
  final keyOutput = GlobalKey();
  final keyTimer = GlobalKey();
  final keyButtonStartExercise = GlobalKey();
  final keyButtonCheckAnswer = GlobalKey();
  final keyButtonSendAnswer = GlobalKey();

  BuildContext? myContext;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 200), () {
        ShowCaseWidget.of(myContext!).startShowCase([
          keyButtonBack,
          keyAppbarTitle,
          keyExerciseName,
          keyExerciseCaption,
          keyReorderables,
          keyTimer,
          keyOutput,
          keyButtonStartExercise,
          keyButtonCheckAnswer,
          keyButtonSendAnswer,
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) {
          myContext = context;
          return Scaffold(
            appBar: AppBar(
              title: CustomShowcaseWidget(
                globalKey: keyAppbarTitle,
                description: "Berikut adalah ID latihan yang sedang dikerjakan",
                child: CustomTextHelper.textBody(
                  context: context,
                  text: "Latihan ID : ${controller.exerciseId}",
                ),
              ),
              leading: CustomShowcaseWidget(
                globalKey: keyButtonBack,
                description: "Berikut adalah tombol kembali",
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.angleLeft,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              centerTitle: false,
              backgroundColor: ColorConstants.kPrimaryColor,
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.all(dimenMedium),
              child: Row(
                children: [
                  Expanded(
                    child: _buildLeftContent(context),
                  ),
                  SizedBox(width: dimenMedium),
                  Expanded(
                    child: _buildRightContent(context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      onComplete: (index, key) {
        if (index == 7) {
          controller.isStarted.toggle();
          controller.startTimer();
        }

        if (index == 9) {
          //end tutorial then let student finish the example exercise
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return DialogHelper.dialogEndTutorial(context);
            },
          );
        }
      },
    );
  }

  _buildLeftContent(BuildContext context) {
    return Card(
      elevation: dimenSmall,
      child: Padding(
        padding: EdgeInsets.all(dimenSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomShowcaseWidget(
              globalKey: keyExerciseName,
              description: "Berikut adalah nama latihan yang sedang dikerjakan",
              child: CustomTextHelper.textBody(
                context: context,
                text: controller.exerciseName,
                customWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: dimenSmall / 2),
            CustomShowcaseWidget(
              globalKey: keyExerciseCaption,
              description:
                  "Berikut adalah instruksi latihan yang sedang dikerjakan",
              child: CustomTextHelper.textCaption(
                context: context,
                text: controller.exerciseCaption,
              ),
            ),
            SizedBox(height: dimenSmall),
            Obx(() {
              return CustomShowcaseWidget(
                globalKey: keyReorderables,
                description:
                    "Berikut adalah susunan blok kode yang harus diurutkan",
                child: ReorderableListView(
                  scrollController: ScrollController(),
                  shrinkWrap: true,
                  children: controller.studentAnswer.map((element) {
                    final valueKey = element["keyValue"] as int;
                    final valueText = element["codeValue"] as String;
                    final valuePadding = element["paddingValue"] as double;

                    return Card(
                      key: ValueKey(valueKey),
                      child: ListTile(
                        leading: SizedBox(width: valuePadding),
                        title: CustomTextHelper.textBody(
                          context: context,
                          text: valueText,
                        ),
                        tileColor: ColorConstants.kPrimaryColor,
                      ),
                    );
                  }).toList(),
                  onReorder: (oldIndex, newIndex) {
                    if (controller.isStarted.value) {
                      if (!controller.isFinished.value) {
                        controller.onReorder(oldIndex, newIndex);
                      }
                    }
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  _buildRightContent(BuildContext context) {
    return Card(
      elevation: dimenSmall,
      child: Padding(
        padding: EdgeInsets.all(dimenSmall),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextHelper.textBody(
                        context: context,
                        text: "Output yang diharapkan :",
                      ),
                      CustomShowcaseWidget(
                        globalKey: keyTimer,
                        description:
                            "Berikut adalah informasi waktu pengerjaan",
                        child: StreamBuilder<int>(
                          stream: controller.stopwatchTimer.rawTime,
                          initialData: controller.stopwatchTimer.rawTime.value,
                          builder: (context, snapshot) {
                            final snapshotData = snapshot.data as int;
                            final displayTime = StopWatchTimer.getDisplayTime(
                                snapshotData,
                                hours: true);
                            final hideMilSecTime = displayTime.substring(0, 8);
                            return CustomTextHelper.textBody(
                              context: context,
                              text: hideMilSecTime,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: CustomShowcaseWidget(
                      globalKey: keyOutput,
                      description:
                          "Berikut adalah gambar output yang diharapkan",
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(dimenSmall / 2),
                        child:
                            Image.asset("assets/images/code/output_soal_1.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: dimenSmall),
            Obx(
              () {
                if (controller.isStarted.value) {
                  return Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(() {
                          return CustomShowcaseWidget(
                            globalKey: keyButtonCheckAnswer,
                            description: "Berikut adalah tombol cek jawaban",
                            child: ElevatedButton(
                              onPressed: (controller.isCorrect.value)
                                  ? null
                                  : () {
                                      controller.checkAnswer(context);
                                    },
                              child: CustomTextHelper.textBody(
                                context: context,
                                text: "Cek Jawaban",
                                customColor: Colors.white,
                              ),
                            ),
                          );
                        }),
                        SizedBox(width: dimenSmall),
                        Obx(() {
                          return CustomShowcaseWidget(
                            globalKey: keyButtonSendAnswer,
                            description:
                                "Berikut adalah tombol mengirim jawaban",
                            child: ElevatedButton(
                              onPressed: (controller.isCorrect.value)
                                  ? () {
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return DialogHelper
                                              .dialogSendAnswerExercise(
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
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    width: double.maxFinite,
                    child: CustomShowcaseWidget(
                      globalKey: keyButtonStartExercise,
                      description:
                          "Berikut adalah tombol untuk mengerjakan latihan",
                      child: ElevatedButton(
                        child: CustomTextHelper.textBody(
                          context: context,
                          text: "Kerjakan Latihan",
                          customColor: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
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
      contentPadding: EdgeInsets.all(dimenSmall / 2),
      description: description,
      descTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      overlayPadding: EdgeInsets.all(dimenSmall / 2),
    );
  }
}
