import 'package:common_utils/common_utils.dart';
import 'package:date_format/date_format.dart';

import '../log.dart';

class DateUtil {
  /// 获取当前时间
  static DateTime currentDateTime = DateTime.now();

  /// 获取当前时间戳
  /// millisecondsSinceEpoch 秒
  /// microsecondsSinceEpoch 毫秒
  static int get currentTimeStamp => currentDateTime.millisecondsSinceEpoch;

  /// 获取某个时间的时间戳
  /// dateTime 时间
  static int getTimeStamp(DateTime dateTime) => dateTime.millisecondsSinceEpoch;

  static String getTimeStampISO8601(DateTime dateTime) {
    final utcTime = dateTime.toUtc();
    String formattedTimeStr = "${utcTime.year.toString().padLeft(4, '0')}-"
        "${utcTime.month.toString().padLeft(2, '0')}-"
        "${utcTime.day.toString().padLeft(2, '0')}T"
        "${utcTime.hour.toString().padLeft(2, '0')}:"
        "${utcTime.minute.toString().padLeft(2, '0')}:"
        "${utcTime.second.toString().padLeft(2, '0')}."
        "${utcTime.millisecond.toString().padLeft(3, '0')}Z";

    return formattedTimeStr;
  }

  /// 把这种时间格式的字符串21:07:15转成这种格式21:07
  static String getShortTimeStr(String timeStr) {
    final timeList = timeStr.split(':');
    return '${timeList[0]}:${timeList[1]}';
  }

  /// 将某一个时间戳转时间
  /// timeStamp 时间戳
  static DateTime getMicroTimeStampToDateTime(int microTimeStamp) =>
      DateTime.fromMicrosecondsSinceEpoch(microTimeStamp);
  static DateTime getMilliTimeStampToDateTime(int milliTimeStamp) =>
      DateTime.fromMillisecondsSinceEpoch(milliTimeStamp);

  /// 判断某个年份是否是闰年
  /// year 年
  static bool isLeapYear(int year) =>
      (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

  /// 获取当前某个时间是星期几，默认是当前时间
  /// dateTime 时间
  static int getWeekByDate({DateTime? dateTime}) =>
      (dateTime ?? currentDateTime).weekday;

  /// 获取某个时间的下一天，Duration(days: 1) 1 可以变成参数，想传多长时间可自定义
  /// dateTime 时间
  static DateTime getNextDay({DateTime? dateTime}) =>
      (dateTime ?? currentDateTime).add(const Duration(days: 1));

  /// 获取某个时间的上一天，Duration(days: 1) 1 可以变成参数，想传多长时间可自定义
  /// dateTime 时间
  static DateTime getLastDay({DateTime? dateTime}) =>
      (dateTime ?? currentDateTime).subtract(const Duration(days: 1));

  /// 获取某年某个月份有多少天
  /// month 月份
  /// year 是哪年，不传默认当前年
  static int getDaysAMonth(int month, {int? year}) =>
      month == 4 || month == 6 || month == 9 || month == 11
          ? 30
          : month == 2
              ? (isLeapYear(year ?? currentDateTime.year) ? 29 : 28)
              : 31;

  /// 获取某个时间字符串展示 例如：2024-01-01 00:01:01
  /// dateType 时间格式类型
  /// dateTime 某个时间，不传默认 当前时间
  static String getDateFormatTime({DateType? dateType, DateTime? dateTime}) =>
      formatDate(
          dateTime ?? currentDateTime, (dateType ?? DateType.YYYYMMDD).format);

  static String? getDateFormatTimeFromTimeStamp(int timeStamp,
      {bool? useMicro = false, DateType? dateType = DateType.YYYYMMDD}) {
    return (useMicro ?? false)
        ? getDateFormatTime(
            dateTime: getMicroTimeStampToDateTime(timeStamp),
            dateType: dateType)
        : getDateFormatTime(
            dateTime: getMilliTimeStampToDateTime(timeStamp),
            dateType: dateType);
  }

  static String getDateTimeStrFromTimeStampStr(String timeStampStr,
      {DateType dateType = DateType.YYYY_MM_DD_HHMMSS}) {
    try {
      final timeStamp = int.parse(timeStampStr);
      final datetime = getMilliTimeStampToDateTime(timeStamp);
      return getDateFormatTime(dateTime: datetime, dateType: dateType);
    } catch (e) {
      Log.e('DateUtil - getDateTimeStrFromTimeStampStr()', e);
    }
    return '';
  }

  /// 将某个时间转成字符串
  /// dateTime 某个时间，不传默认 当前时间
  static String getTimeStr({DateTime? dateTime}) =>
      (dateTime ?? currentDateTime).toString();

  /// 将某个字符串转成时间
  /// timeString 某个时间字符串
  static DateTime getDateByStr(String timeString) => DateTime.parse(timeString);

  /// 比较两个时间大小
  static TimeSort timeComparison(DateTime time1, DateTime time2) =>
      time1.isBefore(time2)
          ? TimeSort.descending
          : time1.isAfter(time2)
              ? TimeSort.ascending
              : TimeSort.same;

  /// 获取两个时间相差多久
  /// ⚠️注意：Duration 是用来表示时间跨度（差值）的类，例如27天，4小时，12分钟和3秒。
  /// ⚠️注意：Duration 提供了很多时间单位转换的方法以及时间加减计算的方法，使用起来非常方便。
  static Duration getDifferenceTime(DateTime time1, DateTime time2) =>
      time1.difference(time2);
}

enum DateType {
  YYYY([yyyy]),
  YYYYMM([yyyy, '.', mm]),
  YYYYMMDD([yyyy, '.', mm, '.', dd]),
  YYYY_MM_DD([yyyy, '-', mm, '-', dd]),
  YYYYMMDDHH([yyyy, '.', mm, '.', dd, " ", HH]),
  YYYYMMDDHHMM([yyyy, '.', mm, '.', dd, " ", HH, ":", nn]),
  YYYYMMDDHHMMSS([yyyy, '.', mm, '.', dd, " ", HH, ":", nn, ":", ss]),
  YYYY_MM_DD_HHMM([yyyy, '-', mm, '-', dd, " ", HH, ":", nn]),
  YYYY_MM_DD_HHMMSS([yyyy, '-', mm, '-', dd, " ", HH, ":", nn, ":", ss]);

  final List<String> format;

  const DateType(this.format);
}

enum TimeSort {
  ascending("升序"),
  descending("降序"),
  same("相同");

  final String title;

  const TimeSort(this.title);
}

class ZHAliPayTimelineInfo implements TimelineInfo {
  String suffixAgo() => '前';

  String suffixAfter() => '后';

  int maxJustNowSecond() => 30;

  String lessThanOneMinute() => '刚刚';

  String customYesterday() => '昨天';

  bool keepOneDay() => true;

  bool keepTwoDays() => false;

  String oneMinute(int minutes) => '$minutes分';

  String minutes(int minutes) => '$minutes分';

  String anHour(int hours) => '$hours小时';

  String hours(int hours) => '$hours小时';

  String oneDay(int days) => '$days天';

  String weeks(int week) => ''; //x week(星期x).

  String days(int days) => '$days天';
}
