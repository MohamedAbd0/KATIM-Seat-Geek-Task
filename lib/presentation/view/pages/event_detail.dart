import 'package:flutter/material.dart';
import 'package:katim_task/data/models/event_model.dart';
import '../../../utils/service/date_format.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/constants/strings.dart';
import '../widget/divider.dart';
import '../widget/favorite.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({Key? key, required this.event}) : super(key: key);
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: BackButton(
                  color: ColorConstants.mainColor,
                ),
                title: Text(
                  event.title,
                  textScaleFactor: 1.25,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                trailing: FavoriteIcon(
                  eventID: event.id,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SizeConstants.normalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomDivider(),
                    const SizedBox(
                      height: SizeConstants.smallPadding,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        SizeConstants.normalRadiusCircular,
                      ),
                      child: Image.network(
                        event.performers.isNotEmpty
                            ? event.performers.first.image!
                            : defoultIamge,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        CustomDateFormat.format(
                          event.datetimeLocal,
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        event.venue.address,
                      ),
                    ),
                    Text(event.description)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
