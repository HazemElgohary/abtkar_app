import 'dart:developer';
import 'dart:ui';

import 'package:queen/queen.dart';

class AppLangConfig extends NationsConfig {
  @override
  List<Locale> get supportedLocales => const [
    // english
    Locale('en'),
    // arabic
    Locale('ar'),
  ];

  @override
  String notFound(String key) {
    log('[Queen] can not find key: $key');
    return 'null';
  }
}