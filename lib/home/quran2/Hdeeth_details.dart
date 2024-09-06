import 'package:flutter/material.dart';
import 'package:islamii_app/AppColors.dart';
import 'package:islamii_app/home/quran2/hadeeth.dart';
import 'package:islamii_app/home/quran2/item_HadeethDetails.dart';
import 'package:provider/provider.dart';

import '../../AppColors.dart';
import '../../providers/app_config_provider.dart';
import 'hadeeth.dart';
import 'item_HadeethDetails.dart';
class HadeethDetails extends StatelessWidget {
  static const String routeName='Hadeeth_details';

  @override
  Widget build(BuildContext context) {
    var args= ModalRoute.of(context)?.settings.arguments as Hadeeth;
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
        Scaffold(appBar: AppBar(
          title: Text(args.title,
            style:Theme.of(context).textTheme.bodyLarge ,),
        ),
          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width*0.06,
                vertical: MediaQuery.of(context).size.height*0.08
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:provider.isDarkMode()?
                AppColors.primaryDarkColor
                    :AppColors.whiteColor
            ),
            child: ListView.builder(
                itemBuilder: (context,index){
                  return ItemHadeethDetails(content:args.content[index]);
                },
                itemCount: args.content.length),
          ),

        )],);

  }
}