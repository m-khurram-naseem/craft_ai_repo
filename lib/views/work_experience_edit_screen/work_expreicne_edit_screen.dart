import 'package:craft_ai/views/work_experience_edit_screen/widgets/work_experience_field.dart';
import 'package:craft_ai/views/work_experience_edit_screen/widgets/work_experience_save_btn.dart';
import 'package:craft_ai/views/work_experience_edit_screen/widgets/work_experience_text.dart';
import 'package:flutter/material.dart';

class WorkExpreicneEditScreen extends StatelessWidget {
  final bool isUpdate;
  const WorkExpreicneEditScreen({super.key, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUpdate ? 'Update Experience' : 'Add Experience',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                WorkExperienceText(text: 'Job Designation'),
                WorkExperienceField(hint: 'Enter your designation here...'),
                WorkExperienceText(text: 'Job Description'),
                WorkExperienceField(hint: 'Enter job description here...'),
                WorkExperienceText(text: 'Company Name'),
                WorkExperienceField(hint: 'Enter company name here...'),
                WorkExperienceText(text: 'Company Adress'),
                WorkExperienceField(hint: 'Enter company adress here...'),
                WorkExperienceText(text: 'Start Date'),
                WorkExperienceField(
                  hint: 'Enter start date here...',
                  isDateField: true,
                ),
                WorkExperienceText(text: 'End Date'),
                WorkExperienceField(
                  hint: 'Enter end date here...',
                  isDateField: true,
                ),
              ],
            ),
            WorkExperienceSaveBtn(),
          ],
        ),
      ),
    );
  }
}
