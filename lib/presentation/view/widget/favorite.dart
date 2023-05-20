import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/constants/colors.dart';
import '../../cubits/local_events/local_events_cubit.dart';
import 'package:katim_task/di.dart' as di;

class FavoriteIcon extends StatelessWidget {
  final int eventID;
  final bool enable;
  const FavoriteIcon({
    super.key,
    required this.eventID,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    final localEventsCubit = di.locator<LocalEventsCubit>();

    return BlocBuilder<LocalEventsCubit, LocalEventsState>(
      builder: (context, state) {
        if (state.eventsID.contains(eventID.toString())) {
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: ColorConstants.red,
            ),
            onPressed: enable
                ? () {
                    localEventsCubit.unfavorite(id: eventID.toString());
                  }
                : null,
          );
        } else {
          if (enable) {
            return IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: ColorConstants.mainColor,
              ),
              onPressed: () {
                localEventsCubit.favorite(id: eventID.toString());
              },
            );
          } else {
            return const SizedBox();
          }
        }
      },
    );
  }
}
