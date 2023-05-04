// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/font.dart';
import '../../../utils/constants/size.dart';
import '../../cubits/remote_events/remote_events_cubit.dart';
import '../widget/divider.dart';
import '../widget/event_card.dart';
import '../widget/search_text.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({Key? key}) : super(key: key);

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SearchTextFiled(),
            const SizedBox(
              height: SizeConstants.smallPadding,
            ),
            BlocBuilder<RemoteEventsCubit, RemoteEventsState>(
              builder: (context, state) {
                if (state is RemoteEventsLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorConstants.mainColor,
                    ),
                  );
                } else if (state is RemoteEventsSuccess) {
                  if (state.events.isEmpty) {
                    return const Center(
                      child: Text(
                        'Oops!, No '
                        'Result Found.',
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const CustomDivider(),
                        itemCount: state.events.length,
                        itemBuilder: (context, position) {
                          return EventCard(
                            event: state.events[position],
                          );
                        },
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Seat Geek',
                        style: TextStyle(
                          fontSize: FontSizeConstants.large,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.mainColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nFind and Discover events',
                            style: DefaultTextStyle.of(context).style,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: SizeConstants.normalPadding,
            ),
          ],
        ),
      ),
    );
  }
}
