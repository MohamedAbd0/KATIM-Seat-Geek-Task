import 'package:dartz/dartz.dart';
import '../../data/failure.dart';
import '../../data/models/event_model.dart';

//Repository
abstract class OnlineEventRepository {
  Future<Either<Failure, Events>> getEvents(String query);
}
