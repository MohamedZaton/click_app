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

  bool isTransactionExpired(
      {required String createTime, required int exprieHour}) {
    var format = DateFormat("HH:mm:ss");
    var createPlusHour =
        format.parse(createTime).add(Duration(hours: exprieHour));
    var endTimeNow = DateTime.now();
    print("createPlusHour $createPlusHour - endTimeNow = $endTimeNow");
    print(
        "createPlusHour - endTimeNow =  ${createPlusHour.difference(endTimeNow).inHours}");

    return true;
  }
}
