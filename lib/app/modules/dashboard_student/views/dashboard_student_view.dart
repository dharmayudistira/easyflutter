import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/modules/list_exercise_widget_tree_reconstruction/views/list_exercise_widget_tree_reconstruction_view.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_student_controller.dart';

class DashboardStudentView extends GetView<DashboardStudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller.featureController,
        children: [
          _buildDashboardContent(context),
          // ListExerciseCodeReconstructionView(),
          ListExerciseWidgetTreeReconstructionView(),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            child: CustomTextHelper.textBody(
              context: context,
              text: "EasyFlutter",
            ),
            onPressed: () {
              controller.navigateFeature(0);
            },
          ),
          Row(
            children: [
              // TextButton(
              //   child: CustomTextHelper.textBody(
              //     context: context,
              //     text: "Code Reconstruction",
              //   ),
              //   onPressed: () {
              //     controller.navigateFeature(1);
              //   },
              // ),
              // SizedBox(width: dimenMedium),
              TextButton(
                child: CustomTextHelper.textBody(
                  context: context,
                  text: "Widget Tree Reconstruction",
                ),
                onPressed: () {
                  controller.navigateFeature(1);
                },
              ),
              SizedBox(width: dimenMedium),
              IconButton(
                onPressed: () {
                  _buildDialogLogout(context);
                },
                icon: FaIcon(
                  FontAwesomeIcons.signOutAlt,
                  color: Colors.black,
                  size: dimenMedium * 0.65,
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: ColorConstants.kPrimaryColor,
      elevation: 0,
      leading: Container(),
    );
  }

  Widget _buildDashboardContent(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: controller.dashboardContentController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        // _buildCodeReconstructionInformation(context),
        _buildWidgetTreeReconstructionInformation(context),
      ],
    );
  }

  Widget _buildWidgetTreeReconstructionInformation(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: dimenExtraLarge,
          vertical: dimenMedium,
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // IconButton(
              //   onPressed: () {
              //     controller.previousContent();
              //   },
              //   icon: FaIcon(FontAwesomeIcons.angleDoubleUp),
              // ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(dimenSmall),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(dimenSmall),
                          child: Image.asset(
                            "assets/images/img_widget_tree_reconstruction.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(dimenMedium),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextHelper.textTitle(
                              context: context,
                              text: "Apa itu\nWidget Tree Reconstruction ?",
                            ),
                            SizedBox(height: dimenMedium),
                            CustomTextHelper.textBody(
                              context: context,
                              text:
                                  "Widget Tree Reconstruction menerapkan metode Concept Map. "
                                  "Mahasiswa diberikan peta konsep dari dosen (ahli) yang sudah "
                                  "dihilangkan beberapa bagian, sehingga mahasiswa perlu melengkapi peta "
                                  "konsep tersebut dengan jawaban yang sudah disediakan.",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildCodeReconstructionInformation(BuildContext context) {
  //   return Container(
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(
  //         horizontal: dimenExtraLarge,
  //         vertical: dimenMedium,
  //       ),
  //       child: Container(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             Row(
  //               children: [
  //                 Expanded(
  //                   flex: 3,
  //                   child: Container(
  //                     child: Padding(
  //                       padding: EdgeInsets.all(dimenMedium),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           CustomTextHelper.textTitle(
  //                             context: context,
  //                             text: "Apa itu\nCode Reconstruction ?",
  //                           ),
  //                           SizedBox(height: dimenMedium),
  //                           CustomTextHelper.textBody(
  //                             context: context,
  //                             text:
  //                                 "Code Reconstruction menerapkan metode Parsons Problem, "
  //                                 "di mana terdapat blok-blok kode yang sudah disusun secara "
  //                                 "acak sehingga mahasiswa perlu menyusunnya ke susunan yang benar.",
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Expanded(
  //                   flex: 4,
  //                   child: Container(
  //                     child: Padding(
  //                       padding: EdgeInsets.all(dimenSmall),
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(dimenSmall),
  //                         child: Image.asset(
  //                           "assets/images/img_code_reconstruction.png",
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             IconButton(
  //               onPressed: () {
  //                 controller.nextContent();
  //               },
  //               icon: FaIcon(FontAwesomeIcons.angleDoubleDown),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Future<dynamic> _buildDialogLogout(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomTextHelper.textTitleDialog(
          context: context,
          text: "Keluar ?",
        ),
        content: CustomTextHelper.textBodyDialog(
            context: context, text: "Apakah Anda yakin untuk keluar ?"),
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
            onPressed: () async {
              await controller.logout(context);
            },
            child: CustomTextHelper.textBody(
              context: context,
              text: "Yakin",
              customColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
