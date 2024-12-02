// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:simple_localization_app/main.dart';
import 'package:simple_localization_app/model/language_model.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton<Language>(

            underline: const SizedBox(),
            icon: const Icon(
              Icons.language,
              color: Colors.black,
            ),
             onChanged: (Language? language) async {
                if (language != null) {
                  MyApp.setLocale(context, Locale(language.languageCode, ""));
                }
              },

              items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                  (e) => DropdownMenuItem<Language>(
                    value: e, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          e.flag,
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(e.name)
                      ],
                    ))).toList(),

        
              )
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),

              Text(
                AppLocalizations.of(context)!.homePage,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                AppLocalizations.of(context)!.about,
              )
              // "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")

              //dropdown button
            ],
          ),
        ),
      ),
    );
  }
}