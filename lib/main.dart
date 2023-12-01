import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';

import 'router/mobile_router.dart';
import 'support/style/app_themes.dart';
import 'support/utils/localize.dart';
import 'support/utils/service_locator/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MaterialApp(
      theme: AppThemes.theme,
      routes: MobileRouter.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: MobileRouter.initialRoute,
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
      onGenerateTitle: (context) => Localize.instance.of(context).appTitle,
    ),
  );
}
