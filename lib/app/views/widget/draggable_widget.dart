import 'package:easyflutter/app/data/answer_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DraggableWidget extends StatelessWidget {
  const DraggableWidget({
    required this.answerList,
    required this.size,
    Key? key,
  }) : super(key: key);

  final List<AnswerWidgetModel> answerList;
  final int size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.r,
      child: Obx(
        () {
          return ListView.separated(
            controller: ScrollController(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: answerList.length,
            itemBuilder: (context, index) {
              final answer = answerList[index];
              final answerContent = answerList[index].content ?? "";
              final isAnswerUsed = answerList[index].isUsed ?? false;
              return isAnswerUsed
                  ? SizedBox(
                      width: size.r,
                      height: size.r,
                      child: Material(
                        child: Center(
                          child: Text(
                            answerContent,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        color: Colors.grey.withOpacity(0.1),
                        shape: const StadiumBorder(),
                      ),
                    )
                  : Tooltip(
                      message: getMessage(answerContent),
                      child: Draggable<AnswerWidgetModel>(
                        data: answer,
                        child: SizedBox(
                          width: size.r,
                          height: size.r,
                          child: Material(
                            child: Center(
                              child: Text(
                                answerContent,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                            color: Colors.grey,
                            shape: const StadiumBorder(),
                          ),
                        ),
                        childWhenDragging: SizedBox(
                          width: size.r,
                          height: size.r,
                          child: Material(
                            color: Colors.grey,
                            child: Center(
                              child: Text(
                                answerContent,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                            shape: const StadiumBorder(),
                          ),
                        ),
                        feedback: SizedBox(
                          width: size.r,
                          height: size.r,
                          child: Material(
                            child: Center(
                              child: Text(
                                answerContent,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                            ),
                            color: Colors.grey.withOpacity(0.75),
                            shape: const StadiumBorder(),
                          ),
                        ),
                      ),
                    );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 32.r,
              );
            },
          );
        },
      ),
    );
  }
}

String getMessage(String answerContent) {
  switch (answerContent) {
    case "Stack":
      return "Widget yang dapat memposisikan widget-widgetnya relatif terhadap tepi kotaknya. Stack berguna jika ingin membuat widget tumpang tindih dengan cara sederhana.";
    case "Container":
      return "Widget yang dapat menggabungkan antara warna, posisi, dan ukuran dari sebuah widget.";
    case "Text":
      return "Widget yang menampilkan teks dan dapat dikonfigurasi untukk font, ukuran, dan warna yang berbeda.";
    case "Icon":
      return "Widget yang menampilkan simbol grafis.";
    case "Image":
      return "Widget yang menampilkan sebuah gambar.";
    case "Center":
      return "Widget yang dapat digunakan untuk membuat widget berada di posisi tengah.";
    case "Row":
      return "Widget yang menampilkan widget - widget didalamnya secara horizontal.";
    case "Column":
      return "Widget yang menampilkan widget - widget didalamnya secara vertical.";
    case "Text Button":
      return "Widget yang menampilkan teks, dapat ditekan.";
    case "Icon Button":
      return "Widget yang menampilkan gambar (ikon), dapat ditekan.";
    case "Elevated Button":
      return "Widget yang menampilkan teks dengan background, dapat ditekan.";
    case "ListView":
      return "Widget yang menampilkan widget - widget di dalamnya secara linear, dapat digulir (scroll).";
    case "GridView":
      return "Widget yang menampilkan widget - widget di dalamnya secara 2D, dapat digulir (scroll).";
    case "Flexible":
      return "Widget yang dapat membungkus widget lain sehingga ukuran widget menjadi fleksibel.";
    case "Expanded":
      return "Widget yang dapat membungkus widget lain dan memaksa widget untuk mengisi ruang ekstra.";
    case "SizedBox":
      return "Widget dengan ukuran tertentu, akan memaksa widget untuk memiliki lebar dan/atau tinggi tertentu";
    case "Spacer":
      return "Widget yang dapat mengisi ruang kosong (tersedia) untuk mengatur jarak antar widget.";
    default:
      return "";
  }
}
