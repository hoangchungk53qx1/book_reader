import 'package:book_reader/ui/splash.dart';
import 'package:book_reader/utils/const.dart';
import 'package:book_reader/viewmodel/app_providers.dart';
import 'package:book_reader/viewmodel/detail_provider.dart';
import 'package:book_reader/viewmodel/explore_provider.dart';
import 'package:book_reader/viewmodel/home_provider.dart';
import 'package:book_reader/viewmodel/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppProvider()),
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => SettingProvider()),
      ChangeNotifierProvider(create: (_) => ExploreProvider()),
      ChangeNotifierProvider(create: (_) => ExploreProvider()),
      ChangeNotifierProvider(create: (_) => DetailProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget? child) {
        return MaterialApp(
          key: appProvider.key,
          debugShowCheckedModeBanner: true,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: themeData(appProvider.theme),
          // darkTheme: themeData(ThemeConfig.darkTheme),
          home: const Splash(),
        );
      },
    );
  }

  ThemeData themeData(ThemeData themeData) {
    return themeData.copyWith(
        textTheme: GoogleFonts.sourceCodeProTextTheme(themeData.textTheme));
  }
}
