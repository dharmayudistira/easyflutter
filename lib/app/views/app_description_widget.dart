import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDescriptionWidget extends StatelessWidget {
  const AppDescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: dimenSmall),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextHelper.textTitle(
              context: context,
              text: "EasyFlutter",
            ),
            Image.asset(
              "assets/images/img_logo_polinema.png",
              width: Get.size.width * 0.2,
              height: Get.size.height * 0.2,
            ),
            CustomTextHelper.textBody(
              context: context,
              text:
                  "EasyFlutter adalah sebuah aplikasi pembelajaran Flutter Layout yang ditujukan untuk mahasiswa polinema pada mata kuliah pemrograman mobile.",
              customAlignment: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
