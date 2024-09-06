import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii_app/AppColors.dart';
import 'package:islamii_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              ///change current theme to dark
              provider.ChangeTheme(ThemeMode.dark);
            },
            child: provider.isDarkMode()
                ? getSelectedWidget(AppLocalizations.of(context)!.dark)
                : getUnSelectedWidget(AppLocalizations.of(context)!.dark),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              ///change current theme to light
              provider.ChangeTheme(ThemeMode.light);
            },
            child: !(provider.isDarkMode())
                ? getSelectedWidget(AppLocalizations.of(context)!.light)
                : getUnSelectedWidget(AppLocalizations.of(context)!.light),
          ),
        ],
      ),
    );
  }

  Widget getSelectedWidget(String text) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: provider.isDarkMode()
              ? Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.yellowColor)
              : Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.primaryColor),
        ),
        Icon(
          Icons.check,
          size: 30,
          color: provider.isDarkMode()
              ? AppColors.yellowColor
              : AppColors.primaryColor,
        )
      ],
    );
  }

  Widget getUnSelectedWidget(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}