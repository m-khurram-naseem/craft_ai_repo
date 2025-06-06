import 'package:craft_ai/views/language_detail_edit_screen/widgets/language_detail_edit_field.dart';
import 'package:craft_ai/views/language_detail_edit_screen/widgets/language_detail_fluency_field.dart';
import 'package:craft_ai/views/language_detail_edit_screen/widgets/language_detail_save_btn.dart';
import 'package:craft_ai/views/language_detail_edit_screen/widgets/language_detail_text.dart';
import 'package:flutter/material.dart';

class LanguageDetailEditScreen extends StatelessWidget {
  final bool isUpdate;
  const LanguageDetailEditScreen({super.key, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUpdate ? 'Update Language' : 'Add Language',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                LanguageDetailText(text: 'Language'),
                LanguageDetailEditField(),
                LanguageDetailText(text: 'Fluency'),
                LanguageDetailFluencyField(),
              ],
            ),
            LanguageDetailSaveBtn(),
          ],
        ),
      ),
    );
  }
}
