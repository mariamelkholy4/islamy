import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:islamii_app/home/quran/quran.dart';
import 'package:islamii_app/home/quran2/hadeeth.dart';
import 'package:islamii_app/home/radio/radio.dart';
import 'package:islamii_app/home/sebha/Sebha.dart';
import 'package:islamii_app/home/settings/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int SelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()?
        Image.asset('assets/images/bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,):
        Image.asset('assets/images/bg3.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title,
              style:Theme.of(context).textTheme.bodyLarge ,),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Theme.of(context).primaryColor
            ),
            child: BottomNavigationBar(
              currentIndex: SelectedIndex,
              onTap: (index){
                SelectedIndex=index;
                setState(() {

                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage('assets/images/quran.png'))
                    ,label: AppLocalizations.of(context)?.quran),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage('assets/images/sebha.png')),label: AppLocalizations.of(context)?.sebha),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage('assets/images/quran-quran-svgrepo-com.png')),label: AppLocalizations.of(context)?.hadeeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage('assets/images/radio.png')),label: AppLocalizations.of(context)?.radio),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),label: AppLocalizations.of(context)?.settings)
              ],
            ),
          ),
          body: tabs[SelectedIndex],

        ),
      ],
    );
  }
  List<Widget> tabs=[
    QuranTab(),
    SebhaTab(),
    HadeethTab(),
    RadioTab(),
    SettingsTab()
  ];
}