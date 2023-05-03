import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:katim_task/data/datasource/online/event_remote_datasource.dart';
import 'package:katim_task/data/failure.dart';
import 'package:katim_task/data/models/event_model.dart';
import '../../domain/repositories/api_repository.dart';
import '../exception.dart';

class EventRepositoryImpl implements EventRepository {
  EventRepositoryImpl({required this.remoteDataSource});

  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, Events>> getEvents(String query) async {
    try {
      //actual query
      final result = await remoteDataSource.getEvents(query);
      return Right(result);
    } on SocketException {
      return const Left(ConnectionFailure('connection failure'));
    } on ServerException {
      return const Left(ServerFailure('server failure'));
    }
  }
}