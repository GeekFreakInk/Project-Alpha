import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;
  
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings;
  
  Future<bool> load() async {
    String jsonString =
      await rootBundle.loadString('locales/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    
      _localizedStrings = jsonMap.map((group, keys){
        return MapEntry(group, keys.toString());
     });
    return true;
  }
  static String returnJsonString(data){
    final keyConversion = data.replaceAllMapped(RegExp(r'\b\w+\b'), (match){
      return '"${match.group(0)}"';
    });
    return keyConversion;
  }
  
  String translate(String groups, String key) {
     var group = _localizedStrings[groups]; 
     var jsonString = returnJsonString(group);
     return jsonDecode(jsonString)[key];
  }
}

class _AppLocalizationsDelegate 
  extends LocalizationsDelegate<AppLocalizations>{

    const _AppLocalizationsDelegate();

    @override
    bool isSupported(Locale locale){
      return ['en', 'nb'].contains(locale.languageCode);
    }

    @override
    Future<AppLocalizations> load(Locale locale) async {
      AppLocalizations localizations = new AppLocalizations(locale);
      await localizations.load();
      return localizations;
    }

    @override
    bool shouldReload(_AppLocalizationsDelegate old) => false;
}
