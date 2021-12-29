import 'package:easyflutter/app/constants/dimen_constants.dart';
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
        padding: EdgeInsets.symmetric(horizontal: dimenSmall, vertical: dimenMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "EasyFlutter",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.black),
            ),
            Image.asset(
              "assets/images/img_logo_polinema.png",
              width: Get.size.width * 0.2,
              height: Get.size.height * 0.2,
            ),
            Text(
              "EasyFlutter adalah sebuah aplikasi pembelajaran Flutter Layout yang ditujukan untuk mahasiswa polinema pada mata kuliah pemrograman mobile.",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}