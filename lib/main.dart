import 'package:abtkar_app/modules/details/cubit/download_image_cubit.dart';
import 'package:abtkar_app/modules/popular_people/cubit/popular_cubit.dart';
import 'package:abtkar_app/modules/popular_people/screen.dart';
import 'package:abtkar_app/shared/observer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:queen/queen.dart';

import 'generated/tr.dart';
import 'inject.dart';

Future<void> main() async {
  await injectServices();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return QueenBuilder(
        enableDevtools: false,
        builder: (context) {
      return DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => PopularCubit(),),
                BlocProvider(create: (context) => DownloadImageCubit(),),
              ],
              child: MaterialApp(
                useInheritedMediaQuery: true,
                builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: Lang.supportedLocales,
                title: Tr.abtkar.tr,
                locale: Lang.current,
                theme: AppTheme.current,
                navigatorKey: Get.key,
                home: const PopularPeopleScreen(),
              ),
            );
          });
    });
  }
}

