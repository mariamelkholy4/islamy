import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii_app/AppColors.dart';
import 'package:islamii_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../AppColors.dart';
import '../../providers/app_config_provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double rotationAngle = 0.0;
  int counter = 0;
  int TasbehaIndex = 0;
  List<String> Tasbeha = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا اله الا الله"
  ];

  void rotateSebha() {
    setState(() {
      rotationAngle += 7.0;
      counter += 1;
      if (counter > 33) {
        counter = 0;
        TasbehaIndex = (TasbehaIndex + 1) % Tasbeha.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 37),
                child: provider.isDarkMode()
                    ? Image.asset('assets/images/head_of_seb7a.png')
                    : Image.asset('assets/images/sebhaHair.png', scale: 1,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 78),
                child: InkWell(
                    onTap: () {
                      rotateSebha();
                    },
                    child: Transform.rotate(
                        angle: rotationAngle * (math.pi / 180),
                        child: provider.isDarkMode()
                            ? Image.asset(
                            'assets/images/body_of_seb7a.png')
                            : Image.asset('assets/images/sebhaa.png', scale: 3,))),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Text(
            AppLocalizations.of(context)!.sebha,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Container(
            width: 69,
            height: 81,
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? AppColors.primaryDarkColor
                    : Color.fromRGBO(183, 147, 95, 0.57),
                borderRadius: BorderRadius.circular(25)),
            child: Center(
                child: Text(
                  '$counter',
                  style: Theme.of(context).textTheme.bodySmall,
                )),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Container(
              width: 150,
              height: 51,
              decoration: BoxDecoration(
                  color: provider.isDarkMode()
                      ? AppColors.yellowColor
                      : AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(Tasbeha[TasbehaIndex],
                  style: provider.isDarkMode()
                      ? Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.blackColor)
                      : Theme.of(context).textTheme.bodySmall,
                ),
              ))
        ],
      ),
    );
  }
}