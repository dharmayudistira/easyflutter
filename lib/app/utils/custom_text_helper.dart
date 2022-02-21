import 'package:flutter/material.dart';

class CustomTextHelper {
  static Widget textTitle({
    required BuildContext context,
    required String text,
    Color customColor = Colors.black,
  }) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: customColor,
          ),
    );
  }

  static Widget textBody({
    required BuildContext context,
    required String text,
    Color customColor = Colors.black,
    FontWeight customWeight = FontWeight.w400,
    TextAlign customAlignment = TextAlign.start,
  }) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            color: customColor,
            fontWeight: customWeight,
          ),
      textAlign: customAlignment,
    );
  }

  static Widget textCaption({
    required BuildContext context,
    required String text,
    Color customColor = Colors.black,
  }) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption?.copyWith(
            color: customColor,
          ),
    );
  }

  static Widget textLabelForm({
    required BuildContext context,
    required String text,
  }) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            color: Colors.black.withOpacity(0.7),
          ),
    );
  }

  static Widget textTitleDialog({
    required BuildContext context,
    required String text,
  }) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  static Widget textBodyDialog({
    required BuildContext context,
    required String text,
  }) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            color: Colors.black.withOpacity(0.7),
          ),
    );
  }

  static Widget textTitleTable({
    required BuildContext context,
    required String text,
  }) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  static Widget textBodyTable({
    required BuildContext context,
    required String text,
  }) {
    return Text(
      text,
      maxLines: 2,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
          ),
    );
  }
}
