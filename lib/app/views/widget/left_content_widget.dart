import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftContentWidget extends StatelessWidget {
  const LeftContentWidget({
    required this.exerciseName,
    required this.exerciseDescription,
    required this.dragTargetContent,
    required this.draggableContent,
    Key? key,
  }) : super(key: key);

  final String exerciseName;
  final String exerciseDescription;
  final Widget dragTargetContent;
  final Widget draggableContent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exerciseName,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: Colors.black),
                ),
                Text(
                  exerciseDescription,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: Colors.black),
                ),
                dragTargetContent,
                draggableContent,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
