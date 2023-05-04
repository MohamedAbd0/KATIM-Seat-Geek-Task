import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:katim_task/presentation/view/pages/listing_page.dart';
import 'di.dart' as di;
import 'domain/repositories/online_repository.dart';
import 'domain/repositories/offline_repository.dart';
import 'utils/service/shared_pref.dart';
import 'presentation/cubits/local_events/local_events_cubit.dart';
import 'presentation/cubits/remote_events/remote_events_cubit.dart';
import 'utils/constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await SharedPrefHelper.getSharedPref();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorConstants.mainColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RemoteEventsCubit(
            di.locator<OnlineEventRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => LocalEventsCubit(
            di.locator<OfflineEventRepository>(),
          )..getAllFavoritesEvents(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KATIM Flutter Coding Task',
        home: ListingPage(),
      ),
    );
  }
}
