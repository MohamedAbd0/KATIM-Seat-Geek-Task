import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../cubits/remote_events/remote_events_cubit.dart';

class SearchTextFiled extends StatefulWidget {
  const SearchTextFiled({super.key});

  @override
  State<SearchTextFiled> createState() => _SearchTextFiledState();
}

class _SearchTextFiledState extends State<SearchTextFiled> {
  final TextEditingController _searchTextEditingController =
      TextEditingController();

  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    final eventsBloc = BlocProvider.of<RemoteEventsCubit>(context);

    return Container(
      color: ColorConstants.mainColor,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: SizeConstants.normalPadding,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: _searchTextEditingController,
                    onChanged: (value) {
                      performSearch(context, value);
                      setState(() {
                        isEmpty = value.isEmpty;
                      });
                    },
                    style: TextStyle(
                      color: ColorConstants.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Search Events...',
                      hintStyle: TextStyle(
                        color: ColorConstants.white,
                      ),
                      fillColor: ColorConstants.fillColor,
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            SizeConstants.smalRadiusCircular,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            SizeConstants.smalRadiusCircular,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorConstants.white,
                      ),
                      suffixIcon: isEmpty
                          ? null
                          : IconButton(
                              icon: Icon(
                                Icons.cancel,
                                color: ColorConstants.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _searchTextEditingController.clear();
                                  isEmpty = true;
                                });
                              },
                            ),
                    ),
                  ),
                ),
              ),
              (eventsBloc.state != const RemoteEventsInit())
                  ? TextButton(
                      onPressed: () {
                        setState(() {
                          _searchTextEditingController.clear();
                        });
                        cancelSearch(context);
                        FocusScope.of(context).unfocus();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: ColorConstants.white,
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: SizeConstants.normalPadding,
                    ),
            ],
          ),
        ],
      ),
    );
  }

  void performSearch(BuildContext context, String value) {
    final eventsBloc = BlocProvider.of<RemoteEventsCubit>(context);
    eventsBloc.getEvents(sources: value);
  }

  void cancelSearch(BuildContext context) {
    final eventsBloc = BlocProvider.of<RemoteEventsCubit>(context);
    eventsBloc.cancelSearch();
  }
}
