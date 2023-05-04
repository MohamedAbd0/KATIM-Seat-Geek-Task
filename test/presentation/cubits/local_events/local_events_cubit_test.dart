import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:katim_task/data/repositories/offline_repository_impl.dart';
import 'package:katim_task/presentation/cubits/local_events/local_events_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockGoalRepository extends Mock implements OfflineEventRepositoryImpl {}

void main() {
  late MockGoalRepository mockGoalRepository;
  late LocalEventsCubit localEventsCubit;

  setUp(() {
    mockGoalRepository = MockGoalRepository();
    localEventsCubit = LocalEventsCubit(mockGoalRepository);
  });

  group('getEventsID()', () {
    List<String> tEventsID = ['1', '2', '3'];

    blocTest<LocalEventsCubit, LocalEventsState>(
      'emits [LocalEventsSuccess] when '
      'getfavorites() is called successfully.',
      setUp: () => when(() => mockGoalRepository.getfavorites())
          .thenAnswer((_) async => tEventsID),
      build: () => localEventsCubit,
      act: (cubit) => cubit.getAllFavoritesEvents(),
      expect: () => <LocalEventsState>[
        LocalEventsSuccess(eventsID: tEventsID),
      ],
      verify: (_) async {
        verify(() => mockGoalRepository.getfavorites()).called(1);
      },
    );

    blocTest<LocalEventsCubit, LocalEventsState>(
      'emits [LocalEventsSuccess] when '
      'favorite() is called successfully.',
      setUp: () {
        when(() => mockGoalRepository.favorite('4')).thenAnswer((_) async {
          return true;
        });

        when(() => mockGoalRepository.getfavorites())
            .thenAnswer((_) async => tEventsID + ['4']);
      },
      build: () => localEventsCubit,
      act: (cubit) => cubit.favorite(id: '4'),
      expect: () => <LocalEventsState>[
        LocalEventsSuccess(eventsID: tEventsID + ['4']),
      ],
      verify: (_) async {
        verify(() => mockGoalRepository.favorite('4')).called(1);
      },
    );
  });
}
