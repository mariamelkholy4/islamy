import 'package:flutter/material.dart';


import 'Hdeeth_details.dart';
import 'hadeeth.dart';
class ItemHadeethName extends StatelessWidget {
  Hadeeth hadeth;
  ItemHadeethName({required this.hadeth});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(HadeethDetails.routeName,
            arguments:hadeth);
      },
      child: Text(
        hadeth.title,textAlign: TextAlign.center
        ,style:Theme.of(context).textTheme.bodySmall ,),
    );
  }
}