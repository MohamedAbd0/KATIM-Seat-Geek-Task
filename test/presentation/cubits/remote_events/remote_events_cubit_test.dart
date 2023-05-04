import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:katim_task/data/failure.dart';
import 'package:katim_task/data/models/event_model.dart';
import 'package:katim_task/data/repositories/online_repository_impl.dart';
import 'package:katim_task/presentation/cubits/remote_events/remote_events_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockGoalRepository extends Mock implements OnlineEventRepositoryImpl {}

void main() {
  late MockGoalRepository mockGoalRepository;
  late RemoteEventsCubit remoteEventsCubit;

  setUp(() {
    mockGoalRepository = MockGoalRepository();
    remoteEventsCubit = RemoteEventsCubit(mockGoalRepository);
  });

  group('getEvents()', () {
    List<EventModel> tEvents = [
      EventModel(
        id: 1,
        datetimeLocal: DateTime(2023, 5, 3, 10),
        shortTitle: 'shortTitle',
        url: 'url',
        title: 'title',
        description: 'description',
        performers: [],
        venue: Venue(
          address: 'UAE',
        ),
      )
    ];

    blocTest<RemoteEventsCubit, RemoteEventsState>(
      'emits [RemoteEventsLoading, RemoteEventsSuccess] when '
      'getEvents() is called successfully.',
      setUp: () => when(() => mockGoalRepository.getEvents('football'))
          .thenAnswer((_) async => Right(Events(events: tEvents))),
      build: () => remoteEventsCubit,
      act: (cubit) => cubit.getEvents(sources: 'football'),
      expect: () => <RemoteEventsState>[
        const RemoteEventsLoading(),
        RemoteEventsSuccess(events: tEvents),
      ],
      verify: (_) async {
        verify(() => mockGoalRepository.getEvents('football')).called(1);
      },
    );

    blocTest<RemoteEventsCubit, RemoteEventsState>(
      'emits [RemoteEventsLoading, RemoteEventsFailed] when '
      'getEvents() failed.',
      setUp: () => when(() => mockGoalRepository.getEvents('football'))
          .thenAnswer(
              (_) async => const Left(ConnectionFailure('connection failure'))),
      build: () => remoteEventsCubit,
      act: (cubit) => cubit.getEvents(sources: 'football'),
      expect: () => <RemoteEventsState>[
        const RemoteEventsLoading(),
        const RemoteEventsFailed(error: 'connection failure'),
      ],
      verify: (_) async {
        verify(() => mockGoalRepository.getEvents('football')).called(1);
      },
    );
  });
}
