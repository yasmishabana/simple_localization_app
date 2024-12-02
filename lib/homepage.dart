import 'package:flutter/material.dart';
import 'package:simple_localization_app/main.dart';
import 'package:simple_localization_app/model/language_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.homePage,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
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
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context)!.about,
          ),
        ),
      ),
    );
  }
}
