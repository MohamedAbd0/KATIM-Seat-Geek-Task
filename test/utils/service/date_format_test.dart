import 'package:flutter_test/flutter_test.dart';
import 'package:katim_task/utils/service/date_format.dart';

void main() {
  test('data format', () {
    var result = CustomDateFormat.format(DateTime(2023, 5, 3, 10));
    expect(result, 'Wed, 3 May 2023 10:00 AM');
  });
}
