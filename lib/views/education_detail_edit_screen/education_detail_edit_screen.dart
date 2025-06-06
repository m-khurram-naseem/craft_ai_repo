import 'package:craft_ai/views/education_detail_edit_screen/widgets/education_detail_field.dart';
import 'package:craft_ai/views/education_detail_edit_screen/widgets/education_detail_save_btn.dart';
import 'package:craft_ai/views/education_detail_edit_screen/widgets/education_detail_text.dart';
import 'package:flutter/material.dart';

class EducationDetailEditScreen extends StatelessWidget {
  final bool isUpdate;
  const EducationDetailEditScreen({super.key, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUpdate ? 'Update Education' : 'Add Education',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                EducationDetailText(text: 'Degree Name'),
                EducationDetailField(hint: 'Enter your degree here...'),
                EducationDetailText(text: 'Institution Name'),
                EducationDetailField(
                  hint: 'Enter school/college/university here...',
                ),
                EducationDetailText(text: 'Institution Location'),
                EducationDetailField(
                  hint: 'Enter school/college/university adress here...',
                ),
                EducationDetailText(text: 'Start Date'),
                EducationDetailField(
                  hint: 'Enter start date here...',
                  isDateField: true,
                ),
                EducationDetailText(text: 'End Date'),
                EducationDetailField(
                  hint: 'Enter end date here...',
                  isDateField: true,
                ),
              ],
            ),
            EducationDetailSaveBtn(),
          ],
        ),
      ),
    );
  }
}
