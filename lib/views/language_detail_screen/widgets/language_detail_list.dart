import 'package:craft_ai/models/language.dart';
import 'package:craft_ai/views/language_detail_edit_screen/language_detail_edit_screen.dart';
import 'package:craft_ai/views/language_detail_edit_screen/widgets/language_detail_fluency_field.dart';
import 'package:craft_ai/views/language_detail_screen/widgets/language_detail_add_btn.dart';
import 'package:craft_ai/views/language_detail_screen/widgets/language_detail_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageDetailList extends StatelessWidget {
  final List<Language> languages;
  const LanguageDetailList({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            for (var i = 0; i < languages.length; i++)
              LanguageDetailTile(
                title: languages[i].name,
                subtitle: getFluencyFromIndex(languages[i].fluency),
                onEditTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder:
                          (context) => LanguageDetailEditScreen(
                            languages: languages,
                            currentIndex: i,
                          ),
                    ),
                  );
                },
                trailing: Icon(
                  Icons.edit_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                isTopRounded: i == 0,
                isBottomRounded: i == languages.length - 1,
              ),
          ],
        ),
        LanguageDetailAddBtn(
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder:
                    (context) => LanguageDetailEditScreen(languages: languages),
              ),
            );
          },
        ),
      ],
    );
  }
}
