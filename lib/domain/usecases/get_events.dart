import 'package:dartz/dartz.dart';
import 'package:katim_task/domain/repositories/online_repository.dart';

import '../../data/failure.dart';
import '../../data/models/event_model.dart';

class GetEvents {
  final OnlineEventRepository eventRepository;
  GetEvents(this.eventRepository);

  Future<Either<Failure, Events>> execute(String query) =>
      eventRepository.getEvents(query);
}
