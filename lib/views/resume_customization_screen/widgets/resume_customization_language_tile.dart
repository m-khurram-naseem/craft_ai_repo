import 'package:craft_ai/models/language.dart';
import 'package:craft_ai/views/language_detail_edit_screen/widgets/language_detail_fluency_field.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_base_tile.dart';
import 'package:flutter/material.dart';

class ResumeCustomizationLanguageTile extends StatelessWidget {
  final Language language;
  final int fluency;
  final bool isTopRounded;
  final bool isBottomRounded;
    final bool isExist;
  final void Function(Language language) onAddTap;
  final void Function(Language language) onDeleteTap;
  const ResumeCustomizationLanguageTile({
    super.key,
    required this.language,
    required this.fluency,
    this.isTopRounded = false,
    this.isBottomRounded = false,
        required this.isExist,
    required this.onAddTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return ResumeCustomizationBaseTile(
      title: language.name,
      trailing:  isExist
              ? GestureDetector(
                onTap: () {
                  onDeleteTap(language);
                },
                child: Image.asset(
                  'assets/icons/delete.png',
                  width: 23,
                  color: Colors.red.withAlpha(200),
                ),
              )
              : GestureDetector(
                onTap: () {
                  onAddTap(language);
                },
                child: Image.asset(
                  'assets/icons/plus.png',
                  width: 21,
                  color: Theme.of(context).colorScheme.primary.withAlpha(200),
                ),
              ),
      subtitle: getFluencyFromIndex(fluency),
      isBottomRounded: isBottomRounded,
      isTopRounded: isTopRounded,     
    );
  }
}
