import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamii_app/home/quran2/item_HadeethName.dart';
import 'package:islamii_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import '../../AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadeethTab extends StatefulWidget {
  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<Hadeeth> ahadeethlist=[];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadeethlist.isEmpty){loadHadeethFile();}
    return Column(
      children: [
        Center(
            child: Expanded(
                child: Image.asset('assets/images/hadeeth.png')
            )),
        Divider(
          color:provider.isDarkMode()?
          AppColors.yellowColor
              : AppColors.primaryColor,
          thickness: 3,
        ),
        Text(AppLocalizations.of(context)!.hadeeth_name,style: Theme.of(context).textTheme.bodyMedium,),
        Divider(
          color:provider.isDarkMode()?
          AppColors.yellowColor
              : AppColors.primaryColor,
          thickness: 3,
        ),
        Expanded(

          child: ahadeethlist.isEmpty?
          Center(child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ))
              :
          ListView.separated(
            separatorBuilder:(context,index){
              return Divider(
                color:provider.isDarkMode()?
                AppColors.yellowColor
                    : AppColors.primaryColor,
                thickness: 2,
              );
            },
            itemBuilder: (context,index){
              return ItemHadeethName(hadeth:ahadeethlist[index]); },
            itemCount:ahadeethlist.length,
          ),
        ),
      ],

    );
  }

  void loadHadeethFile()async{
    String hadeethcontent =await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadeethlist = hadeethcontent.split('#\r\n');
    for(int i =0;i<hadeethlist.length;i++){
      print(hadeethlist[i]);
      List<String> hadeethlines=hadeethlist[i].split('\n');
      String title=hadeethlines[0];
      hadeethlines.removeAt(0);
      Hadeeth hadeeth= Hadeeth(title: title, content: hadeethlines);
      ahadeethlist.add(hadeeth);
      setState(() {

      });
    }
  }
}
class Hadeeth{
  String title;
  List<String> content;
  Hadeeth({required this.title,required this.content});
}