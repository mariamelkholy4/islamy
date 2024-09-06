import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamii_app/AppColors.dart';
import 'package:islamii_app/home/quran/item_suraDetails.dart';
import 'package:islamii_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:islamii_app/theme.dart';
class SuraDetails extends StatefulWidget {
  static const String routeName='sura_details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String>verses=[];

  @override
  Widget build(BuildContext context) {
    var args= ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if(verses.isEmpty){
      loadFile(args.index);}
    var provider= Provider.of<AppConfigProvider>(context);
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
          title: Text(args.name,
            style:Theme.of(context).textTheme.bodyLarge ,),
        ),
          body: verses.isEmpty?
          Center(child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          )):

          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width*0.06,
                vertical: MediaQuery.of(context).size.height*0.08
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:
                provider.isDarkMode()?AppColors.primaryDarkColor:AppColors.whiteColor
            ),
            child: ListView.separated(
              separatorBuilder:(context,index){
                return Divider(
                  color:provider.isDarkMode()?AppColors.yellowColor: AppColors.primaryColor,
                  thickness: 2,
                );
              },itemBuilder: (context,index){
              return ItemSuraDetails(content:verses[index],index: index,);
            },
              itemCount: verses.length,),
          ),

        )],);

  }

  void loadFile(int index) async{
    String content = await rootBundle.loadString('assets/files/${index+1}.txt');
    List<String> lines = content.split('\n');
    for(int i =0;i<lines.length ;i++){
      print(lines[i]);
    }
    verses=lines;
    setState(() {

    });
  }
}
class SuraDetailsArgs{
  String name;
  int index;
  SuraDetailsArgs({required this.name,required this.index});
}