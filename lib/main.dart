import 'package:alhaddad_driver/app/utils/themes_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Al haddad-Driver",
      debugShowCheckedModeBanner: false,
      translationsKeys: AppTranslation.translations,
      locale: const Locale('en', 'US'),
      theme: ThemeUtils().buildThemeData(context),
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
