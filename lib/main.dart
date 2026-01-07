import 'package:app_instagram_clone/configs/dependency_injection/injection.dart';
import 'package:app_instagram_clone/configs/routes/auth_session.dart';
import 'package:app_instagram_clone/configs/theme/color/color_config.dart';
import 'package:app_instagram_clone/configs/translations/enum/locales.dart';
import 'package:app_instagram_clone/configs/theme/text/text_theme_config.dart';
import 'package:app_instagram_clone/cores/bloc/bloc_observer_custom.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-in/sign_in_bloc.dart';
import 'package:app_instagram_clone/features/auth/presentation/blocs/sign-up/sign_up_bloc.dart';
import 'package:app_instagram_clone/features/profile/presentation/blocs/logout/logout_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide RouterConfig;
import 'package:app_instagram_clone/configs/routes/router_config.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  // debugPaintSizeEnabled = true;

  const String PATH_TRANSLATION = 'assets/translations';

  Bloc.observer = BlocObserverCustom();

  await getIt<AuthSession>().init();

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInBloc>(create: (context) => getIt<SignInBloc>()),
        BlocProvider<SignUpBloc>(create: (context) => getIt<SignUpBloc>()),
        BlocProvider<LogoutBloc>(create: (context) => getIt<LogoutBloc>())
      ],
      child: MaterialApp.router(
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
      ),
    );
  }
}
