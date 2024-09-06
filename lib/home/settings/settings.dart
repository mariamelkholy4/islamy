import 'package:flutter/material.dart';
import 'package:islamii_app/home/settings/theme_bottom_sheet.dart';
import 'package:islamii_app/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii_app/home/settings/theme_bottom_sheet.dart';
import 'package:islamii_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import '../../AppColors.dart';
import '../../providers/app_config_provider.dart';
import 'language_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {


  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.applanguage == 'en' ?
                    AppLocalizations.of(context)!.english :
                    AppLocalizations.of(context)!.arabic ,
                    style: Theme.of(context).textTheme.bodySmall,),
                  Icon(Icons.arrow_drop_down , size: 40,)
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyMedium,),
          SizedBox(height: 15,),
          InkWell(
            onTap: (){
              showthemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appTheme == ThemeMode.dark ?
                    AppLocalizations.of(context)!.dark :
                    AppLocalizations.of(context)!.light ,
                    style: Theme.of(context).textTheme.bodySmall,),
                  Icon(Icons.arrow_drop_down , size: 40,)
                ],
              ),
            ),
          )
        ],
      ),
    );

  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => LanguageBottomSheet()
    );
  }

  void showthemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context)=> ThemeBottomSheet());
  }
}