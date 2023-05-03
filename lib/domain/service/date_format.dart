import 'package:intl/intl.dart';

class CustomDateFormat {
  static String format(DateTime dateTime) {
    return DateFormat("E, d MMM yyyy hh:mm a").format(dateTime);
  }
}
