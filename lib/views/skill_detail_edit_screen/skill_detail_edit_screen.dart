import 'package:craft_ai/views/skill_detail_edit_screen/widgets/skill_detail_edit_field.dart';
import 'package:craft_ai/views/skill_detail_edit_screen/widgets/skill_detail_save_btn.dart';
import 'package:craft_ai/views/skill_detail_edit_screen/widgets/skill_detail_text.dart';
import 'package:flutter/material.dart';

class SkillDetailEditScreen extends StatelessWidget {
  final bool isUpdate;
  const SkillDetailEditScreen({super.key, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUpdate ? 'Update Skill' : 'Add Skill',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [SkillDetailText(), SkillDetailEditField()],
            ),
            SkillDetailSaveBtn(),
          ],
        ),
      ),
    );
  }
}
