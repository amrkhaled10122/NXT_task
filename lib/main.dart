import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/helpers/route/router.dart';
import 'core/helpers/theme/dark_theme.dart';
import 'core/helpers/theme/light_theme.dart';
import 'core/helpers/theme/models/dark_app_colors.dart';
import 'core/helpers/theme/models/light_app_colors.dart';
import 'core/helpers/theme/theme_provider.dart';
import 'core/service/local/preference_manager.dart';
import 'core/service/network/config/dio_base_options.dart';
import 'l10n/app_localizations.g.dart';
import 'module/reservations/domain/use_case/main_use_case.dart';
import 'module/reservations/presentation/view_model/reservation_view_model.dart';

void main() async {
  // Initialize Flutter and essential services
  WidgetsFlutterBinding.ensureInitialized();
  ApiService.instance.initializeDio();
  await PreferencesManager.setupSharedPreferences();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Configure Providers for dependency injection
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReservationViewModel>(
          create: (_) => ReservationViewModel(reversationCase),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        )
      ],
      child: ScreenUtilInit(
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) => MaterialApp(
            title: 'Flutter task',
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            onGenerateRoute: AppRouter.router,
            themeMode: value.darkTheme ? ThemeMode.dark : ThemeMode.light,
            theme: LightTheme(appColors: LightAppColors()).theme,
            darkTheme: DarkTheme(appColors: DarkAppColors()).theme,
            locale: const Locale('en'),
          ),
        ),
      ),
    );
  }
}
