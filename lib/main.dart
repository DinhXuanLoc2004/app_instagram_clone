import 'package:app_instagram_clone/configs/dependency_injection/injection.dart';
import 'package:app_instagram_clone/configs/theme/color/color_config.dart';
import 'package:app_instagram_clone/configs/translations/enum/locales.dart';
import 'package:app_instagram_clone/configs/theme/text/text_theme_config.dart';
import 'package:app_instagram_clone/cores/bloc/bloc_observer_custom.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide RouterConfig;
import 'package:app_instagram_clone/configs/routes/router_config.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // debugPaintSizeEnabled = true;

  const String PATH_TRANSLATION = 'assets/translations';

  Bloc.observer = BlocObserverCustom();

  runApp(
    EasyLocalization(
      supportedLocales: [Locales.en_US.locale, Locales.vi_VI.locale],
      path: PATH_TRANSLATION,
      fallbackLocale: Locales.en_US.locale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterConfig.router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorConfig.colorSchemeLight,
        textTheme: TextThemeConfig.TEXT_THEME,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorConfig.colorSchemeDark,
        textTheme: TextThemeConfig.TEXT_THEME,
      ),
      themeMode: ThemeMode.system,
    );
  }
}
