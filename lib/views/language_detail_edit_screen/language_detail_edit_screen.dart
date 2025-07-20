import 'package:craft_ai/controllers/profile_controller/profile_providers.dart';
import 'package:craft_ai/controllers/profile_controller/profile_states.dart';
import 'package:craft_ai/models/language.dart';
import 'package:craft_ai/views/language_detail_edit_screen/widgets/language_detail_edit_field.dart';
import 'package:craft_ai/views/language_detail_edit_screen/widgets/language_detail_fluency_field.dart';
import 'package:craft_ai/views/language_detail_edit_screen/widgets/language_detail_save_btn.dart';
import 'package:craft_ai/views/language_detail_edit_screen/widgets/language_detail_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LanguageDetailEditScreen extends ConsumerStatefulWidget {
  final List<Language> languages;
  final int? currentIndex;
  const LanguageDetailEditScreen({
    super.key,
    required this.languages,
    this.currentIndex,
  });

  @override
  ConsumerState<LanguageDetailEditScreen> createState() =>
      _LanguageDetailEditScreenState();
}

class _LanguageDetailEditScreenState
    extends ConsumerState<LanguageDetailEditScreen> {
  late TextEditingController languageNameController;

  int fluency = 0;
  bool isDialogShown = false;

  @override
  void initState() {
    super.initState();
    Language? language;
    if (widget.currentIndex != null) {
      language = widget.languages[widget.currentIndex!];
      fluency = language.fluency;
    }
    languageNameController = TextEditingController(text: language?.name);
  }

  @override
  void dispose() {
    languageNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(profileStateNotifierProvider, (previous, next) {
      if (next is ProfileLoadingState) {
        if (!isDialogShown) {
          isDialogShown = true;
          showDialog(
            context: context,
            builder: (context) {
              return Dialog.fullscreen(
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.onSecondary.withAlpha(80),
                child: Center(
                  child: LoadingAnimationWidget.threeRotatingDots(
                    color: Theme.of(context).colorScheme.primary,
                    size: 25,
                  ),
                ),
              );
            },
          );
        }
      } else if (next is ProfileLoadedState || next is ProfileErrorState) {
        if (isDialogShown) {
          Navigator.of(context)
            ..pop()
            ..pop();
          isDialogShown = false;
        }
      }
    }, onError: (error, stackTrace) {});
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.currentIndex != null ? 'Update Language' : 'Add Language',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
        actions: [
          if (widget.currentIndex != null)
            GestureDetector(
              onTap: () {
                var updatedLanguages = [...widget.languages];
                updatedLanguages.remove(updatedLanguages[widget.currentIndex!]);
                ref
                    .read(profileStateNotifierProvider.notifier)
                    .addLanguages(updatedLanguages);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/icons/delete.png',
                  width: 22,
                  color: Colors.red,
                ),
              ),
            ),
        ],
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                LanguageDetailText(text: 'Language'),
                LanguageDetailEditField(controller: languageNameController),
                LanguageDetailText(text: 'Fluency'),
                LanguageDetailFluencyField(
                  selectedValue: fluency,
                  onChanged: (value) {
                    if (value != null) {
                      fluency = value;
                    }
                  },
                ),
              ],
            ),
            LanguageDetailSaveBtn(
              onPressed: () {
                List<Language> languages = [...widget.languages];
                var language = Language(
                  name: languageNameController.text.trim(),
                  fluency: fluency,
                );
                if (widget.currentIndex == null) {
                  languages.add(language);
                } else {
                  languages[widget.currentIndex!] = language;
                }
                ref
                    .read(profileStateNotifierProvider.notifier)
                    .addLanguages(languages);
              },
            ),
          ],
        ),
      ),
    );
  }
}
