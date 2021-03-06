import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatchWidget extends StatelessWidget {
  const StopWatchWidget({
    required this.stopWatchTimer,
    Key? key,
  }) : super(key: key);

  final StopWatchTimer stopWatchTimer;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: stopWatchTimer.rawTime,
      initialData: stopWatchTimer.rawTime.value,
      builder: (context, snapshot) {
        final value = snapshot.data ?? 0;
        final displayTime =
            StopWatchTimer.getDisplayTime(value, hours: true).substring(0, 8);
        return CustomTextHelper.textBody(
          context: context,
          text: displayTime,
        );
      },
    );
  }
}
