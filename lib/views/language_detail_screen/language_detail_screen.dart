import 'package:craft_ai/utils/comman_widgets/no_data_found_widget.dart';
import 'package:craft_ai/views/language_detail_edit_screen/language_detail_edit_screen.dart';
import 'package:craft_ai/views/language_detail_screen/widgets/language_detail_add_btn.dart';
import 'package:craft_ai/views/language_detail_screen/widgets/language_detail_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageDetailScreen extends StatelessWidget {
  final String title;
  final Map<String, String> languages;
  const LanguageDetailScreen({
    super.key,
    required this.title,
    required this.languages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child:
            title == 'Languages'
                ? NoDataFoundWidget(errorMessage: 'No Language Found')
                : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomScrollView(
                      slivers: [
                        for (var i = 0; i < languages.keys.length; i++)
                          LanguageDetailTile(
                            title: languages.keys.toList()[i],
                            subtitle: languages.values.toList()[i],
                            onEditTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder:
                                      (context) => LanguageDetailEditScreen(
                                        isUpdate: true,
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
                    LanguageDetailAddBtn(),
                  ],
                ),
      ),
      floatingActionButton:
          title == 'Languages'
              ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder:
                          (context) =>
                              LanguageDetailEditScreen(isUpdate: false),
                    ),
                  );
                },
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                foregroundColor: Theme.of(context).colorScheme.surface,
                heroTag: 'Languages',
                elevation: 1,
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.surface,
                ),
                label: Text(
                  'Add Language',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              )
              : null,
    );
  }
}
