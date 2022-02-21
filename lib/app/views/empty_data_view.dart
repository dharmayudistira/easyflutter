import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyDataView extends StatelessWidget {
  final String label;

  EmptyDataView({required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 170,
              child: Lottie.asset("assets/animations/empty_animation.json"),
            ),
            SizedBox(height: dimenSmall),
            CustomTextHelper.textBody(
              context: context,
              text: label + " kosong",
            )
          ],
        ),
      ),
    );
  }
}
