import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/config/theming/my_theme.dart';
import 'package:obour/l10n/app_localizations.dart';
import 'config/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390,844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
          MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale("ar"),
            debugShowCheckedModeBanner: false,
            initialRoute: RoutesName.splashScreen,
            onGenerateRoute: (settings) => AppRouter.onGenerate(settings),
            theme: MyThemeData.lightTheme,
          ),
    );
  }
}


