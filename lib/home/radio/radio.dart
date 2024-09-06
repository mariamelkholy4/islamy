import 'package:flutter/material.dart';
import 'package:islamii_app/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../AppColors.dart';
class RadioTab extends StatelessWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Expanded(
                flex:3,child: Image.asset('assets/images/radioo.png'))
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Center(
                child: Text(AppLocalizations.of(context)!.izaa,style: TextStyle(
                  color: AppColors.blackColor,


                ),),
              ),
            ),

          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(child: Icon(Icons.skip_previous,color: AppColors.primaryColor,)),
            Container(child: Icon(Icons.play_arrow,color: AppColors.primaryColor)),
            Container(child: Icon(Icons.skip_next,color: AppColors.primaryColor))
          ],
        )
      ],
    );
  }
}