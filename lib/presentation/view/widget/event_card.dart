import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/event_model.dart';
import '../../../domain/service/date_format.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/constants/strings.dart';
import '../../cubits/local_events/local_events_cubit.dart';
import '../pages/event_detail.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalEventsCubit, LocalEventsState>(
      builder: (context, state) {
        return Stack(
          children: [
            ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EventDetail(eventModel: event)),
              ),
              isThreeLine: true,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(
                  SizeConstants.normalRadiusCircular,
                ),
                child: Image.network(
                  event.performers[0].image ?? defoultIamge,
                ),
              ),
              title: Text(
                event.title.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.venue.address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorConstants.grey,
                    ),
                  ),
                  Text(
                    CustomDateFormat.format(event.datetimeLocal),
                    style: TextStyle(
                      color: ColorConstants.grey,
                    ),
                  ),
                ],
              ),
            ),
            if (state.eventsID.contains(event.id.toString()))
              Padding(
                padding: const EdgeInsets.all(
                  SizeConstants.smallPadding,
                ),
                child: Icon(
                  Icons.favorite,
                  color: ColorConstants.red,
                ),
              )
          ],
        );
      },
    );
  }
}
