import 'package:flutter_test/flutter_test.dart';
import 'package:katim_task/data/models/event_model.dart';

void main() {
  test('fromJson', () {
    // ARRANGE
    final jsonResponse = {
      'id': 1,
      'datetime_local': '2023-05-03T10:00:00.000',
      'short_title': 'shortTitle event 1',
      'url': 'url',
      'title': 'event 1',
      'description': 'description event 1',
      'performers': [],
      'venue': {'address': 'UAE'}
    };

    // ACT
    final event = EventModel.fromJson(jsonResponse);

    // ASSERT
    expect(event, isA<EventModel>().having((e) => e.id, 'id', 1));
  });

  test('toJson', () {
    // ARRANGE
    final event = EventModel(
      id: 1,
      datetimeLocal: DateTime(2023, 5, 3, 10),
      shortTitle: 'shortTitle event 1',
      url: 'url',
      title: 'title event 1',
      description: 'description event 1',
      performers: [],
      venue: Venue(
        address: 'UAE',
      ),
    );

    // ACT
    final json = event.toJson();

    // ASSERT
    expect(json, isA<Map<String, dynamic>>().having((e) => e['id'], 'id', 1));
  });
}
