import 'package:flutter/material.dart';
import 'package:islamii_app/home/quran/quran_details.dart';
import 'package:islamii_app/theme.dart';
class ItemSuraName extends StatelessWidget {
  String name;
  int index;
  ItemSuraName({required this.name , required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SuraDetails.routeName,
            arguments: SuraDetailsArgs(name: name, index: index));
      },
      child: Text(
        name,textAlign: TextAlign.center
        ,style:Theme.of(context).textTheme.bodySmall ,),
    );
  }
}