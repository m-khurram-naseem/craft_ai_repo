import 'package:craft_ai/views/personal_info_edit_screen/widgets/personal_info_fields.dart';
import 'package:craft_ai/views/personal_info_edit_screen/widgets/personal_info_save_btn.dart';
import 'package:craft_ai/views/personal_info_edit_screen/widgets/personal_info_texts.dart';
import 'package:flutter/material.dart';

class PersonalInfoEditScreen extends StatelessWidget {
  final String title;
  const PersonalInfoEditScreen({super.key, required this.title});

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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                PersonalInfoText(text: 'Name'),
                PersonalInfoField(hint: 'Enter your name here...'),
                PersonalInfoText(text: 'Job Role'),
                PersonalInfoField(hint: 'Enter your designation here...'),
                PersonalInfoText(text: 'Email'),
                PersonalInfoField(hint: 'Enter your email here...'),
                PersonalInfoText(text: 'Contact No.'),
                PersonalInfoField(hint: 'Enter your contact number here...'),
                PersonalInfoText(text: 'Adress'),
                PersonalInfoField(hint: 'Enter your adress here...'),
              ],
            ),
            PersonalInfoSaveBtn(),
          ],
        ),
      ),
    );
  }
}
