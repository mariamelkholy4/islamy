import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppConfigProvider extends ChangeNotifier{
  String applanguage = 'en';
  ThemeMode appTheme= ThemeMode.light;

  String get Applanguage =>applanguage;
  ThemeMode get AppTheme=>appTheme;

  AppConfigProvider() {
    loadPreferences();
  }

  void changeLanguage(String newLanguage)async{
    if(applanguage == newLanguage){
      return;
    }
    applanguage = newLanguage ;
    notifyListeners();
    await SavePreferences();

  }
  void ChangeTheme(ThemeMode newMode)async{
    if(appTheme == newMode){
      return;
    }
    appTheme = newMode ;
    notifyListeners();
    await SavePreferences();
  }

  bool isDarkMode(){
    return appTheme ==ThemeMode.dark;

  }
  Future<void> SavePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('appLanguage', applanguage);
    await prefs.setString('appTheme', appTheme == ThemeMode.light ? 'light' : 'dark');
  }
  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    applanguage = prefs.getString('appLanguage') ?? 'en';
    final themeString = prefs.getString('appTheme') ?? 'light';
    appTheme = themeString == 'light' ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}