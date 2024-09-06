import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamii_app/home/home_screen.dart';
import 'package:islamii_app/home/quran/quran_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'home/quran2/Hdeeth_details.dart';
import 'theme.dart';
void main(){
  runApp(ChangeNotifierProvider( create: (context)=>AppConfigProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routeName ,
      routes: {HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadeethDetails.routeName: (context) => HadeethDetails()},

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.Applanguage),
      themeMode: provider.AppTheme,
      darkTheme: MyTheme.Darkmode,
      theme: MyTheme.lightmode,
    );
  }
}