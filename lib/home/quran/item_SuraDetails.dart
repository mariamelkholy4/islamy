import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islamii_app/theme.dart';
import '../../AppColors.dart';
import '../../providers/app_config_provider.dart';
class ItemSuraDetails extends StatelessWidget {
  String content;
  int index;
  ItemSuraDetails({required this.content , required this.index});

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppConfigProvider>(context);
    return  Text(
        '$content (${index+1})',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl
        ,style:provider.isDarkMode()?
    Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.yellowColor):
    Theme.of(context).textTheme.bodySmall
    );

  }
}