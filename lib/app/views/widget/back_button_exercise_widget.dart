import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BackButtonExercise extends StatelessWidget {
  const BackButtonExercise({
    required this.isStart,
    Key? key,
  }) : super(key: key);

  final RxBool isStart;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (isStart.value) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Apakah Anda yakin untuk keluar?',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                content: Container(
                  width: double.minPositive,
                  child: Text(
                    'Jika Anda menekan tombol "Yakin" maka progres Anda pada latihan ini akan direset.!',
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
                      Get.back();
                    },
                    child: Text('Yakin'),
                  ),
                ],
              );
            },
          );
        } else {
          Get.back();
        }
      },
      icon: FaIcon(
        FontAwesomeIcons.angleLeft,
        color: Colors.black,
      ),
    );
  }
}
