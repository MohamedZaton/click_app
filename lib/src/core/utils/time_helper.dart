import 'package:intl/intl.dart';

class TimeHelper {
  static int differentTwoTime(String firstTime, String endTime) {
    var format = DateFormat("HH:mm:ss");
    var start = format.parse(firstTime);
    var end = format.parse(endTime);

    if (start.isAfter(end)) {
      print('start is big');
      print('difference = ${start.difference(end)}');

      return 1;
    } else if (start.isBefore(end)) {
      print('end is big');
      print('difference = ${end.difference(start)}');
      return -1;
    } else {
      print('time equal');
      print('difference = ${end.difference(start)}');
      return 0;
    }
  }

  int calculateTransactionExpired({required String createTime}) {
    print("create_at_time: $createTime");

    var format = DateFormat("yyyy-MM-dd HH:mm:ss");
    var createPlusHour = format.parse(createTime);
    var endTimeNow = DateTime.now();
    int different = endTimeNow.difference(createPlusHour).inMinutes;
    print("createPlusHour $createPlusHour - endTimeNow = $endTimeNow");
    print(" endTimeNow - createPlusHour =  ${different}");

    return different;
  }

  String getTimeStringHHaMM(int minutesV) {
    final int hour = minutesV ~/ 60;
    final int minutes = minutesV % 60;
    return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
  }

  String intToTimeLeft(int value) {
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    String hourLeft =
        h.toString().length < 2 ? "0" + h.toString() : h.toString();

    String minuteLeft =
        m.toString().length < 2 ? "0" + m.toString() : m.toString();

    String secondsLeft =
        s.toString().length < 2 ? "0" + s.toString() : s.toString();

    String result = "$hourLeft:$minuteLeft:$secondsLeft";
    print("minuets to HH:MM:SS = $result");

    return result;
  }
}
