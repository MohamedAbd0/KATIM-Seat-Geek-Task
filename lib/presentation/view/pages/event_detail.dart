import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katim_task/data/models/event_model.dart';
import '../../../domain/service/date_format.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/constants/strings.dart';
import '../../cubits/local_events/local_events_cubit.dart';
import '../widget/divider.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({Key? key, required this.eventModel}) : super(key: key);
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    final localEventsCubit = BlocProvider.of<LocalEventsCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// appbar
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: BackButton(
                  color: ColorConstants.mainColor,
                ),
                title: Text(
                  eventModel.title,
                  textScaleFactor: 1.25,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                trailing: BlocBuilder<LocalEventsCubit, LocalEventsState>(
                  builder: (context, state) {
                    return state.eventsID.contains(eventModel.id.toString())
                        ? IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: ColorConstants.red,
                            ),
                            onPressed: () {
                              localEventsCubit.unfavorite(
                                  id: eventModel.id.toString());
                            },
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: ColorConstants.mainColor,
                            ),
                            onPressed: () {
                              localEventsCubit.favorite(
                                  id: eventModel.id.toString());
                            },
                          );
                  },
                ),
              ),

              /// content
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
                        eventModel.performers[0].image ?? defoultIamge,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        CustomDateFormat.format(
                          eventModel.datetimeLocal,
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        eventModel.venue.address,
                      ),
                    ),
                    Text(eventModel.description)
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
