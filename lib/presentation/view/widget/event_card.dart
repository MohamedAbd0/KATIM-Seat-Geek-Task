import 'package:flutter/material.dart';
import '../../../data/models/event_model.dart';
import '../../../utils/service/date_format.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/constants/strings.dart';
import '../pages/event_detail.dart';
import 'favorite.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListTile(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventDetail(event: event)),
          ),
          isThreeLine: true,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(
              SizeConstants.normalRadiusCircular,
            ),
            child: Image.network(
              event.performers.isNotEmpty &&
                      event.performers.first.image != null
                  ? event.performers.first.image!
                  : defoultIamge,
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
        FavoriteIcon(
          eventID: event.id,
          enable: false,
        ),
      ],
    );
  }
}
