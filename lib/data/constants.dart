import '../utils/config/config.dart';

class Urls {
  static String eventsListUrl(String query) =>
      '$baseUrl/events?client_id=$seatGeekClientId&q=$query';
}
