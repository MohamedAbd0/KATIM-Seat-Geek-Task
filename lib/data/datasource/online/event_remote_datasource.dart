import 'dart:convert';
import 'package:katim_task/data/exception.dart';
import 'package:katim_task/data/models/event_model.dart';
import 'package:http/http.dart' as http;

import '../../../utils/config/config.dart';

abstract class RemoteDataSource {
  Future<Events> getEvents(String query);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();

  @override
  Future<Events> getEvents(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/events?client_id=$seatGeekClientId&q=$query'),
    );
    if (response.statusCode == 200) {
      return Events.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
