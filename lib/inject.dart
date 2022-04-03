import 'package:abtkar_app/services/popular.dart';
import 'package:flutter/material.dart';
import 'package:queen/facade.dart';
import 'package:queen/locators.dart';

import 'helpers/lang.dart';
import 'helpers/theme.dart';

Future<void> injectServices() async {
  /// init native bridges
  WidgetsFlutterBinding.ensureInitialized();

  /// boot queen
  await App.boot(
    nationsConfig: AppLangConfig(),
    themeConfig: BeautyThemeConfig(),
  );

  /// inject services
  Locators.putLazy(() => PopularPeopleService());

}