import 'package:craft_ai/controllers/profile_controller/profile_providers.dart';
import 'package:craft_ai/controllers/profile_controller/profile_states.dart';
import 'package:craft_ai/models/skill.dart';
import 'package:craft_ai/views/skill_detail_edit_screen/widgets/skill_detail_edit_field.dart';
import 'package:craft_ai/views/skill_detail_edit_screen/widgets/skill_detail_save_btn.dart';
import 'package:craft_ai/views/skill_detail_edit_screen/widgets/skill_detail_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SkillDetailEditScreen extends ConsumerStatefulWidget {
  final bool isUpdate;
  final List<Skill> skills;
  final int? currentIndex;
  const SkillDetailEditScreen({
    super.key,
    required this.isUpdate,
    required this.skills,
    this.currentIndex,
  });

  @override
  ConsumerState<SkillDetailEditScreen> createState() =>
      _SkillDetailEditScreenState();
}

class _SkillDetailEditScreenState extends ConsumerState<SkillDetailEditScreen> {
  late TextEditingController skillController;
  bool isDialogShown = false;

  @override
  void initState() {
    super.initState();
    String? skill;
    if (widget.currentIndex != null) {
      skill = widget.skills[widget.currentIndex!].name;
    }
    skillController = TextEditingController(text: skill);
  }

  @override
  void dispose() {
    skillController.dispose();
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
          widget.isUpdate ? 'Update Skill' : 'Add Skill',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
        actions: [
          if (widget.currentIndex != null)
            GestureDetector(
              onTap: () {
                var updatedSkills = [...widget.skills];
                updatedSkills.remove(updatedSkills[widget.currentIndex!]);
                ref
                    .read(profileStateNotifierProvider.notifier)
                    .addSkills(updatedSkills);
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
                SkillDetailText(),
                SkillDetailEditField(controller: skillController),
              ],
            ),
            SkillDetailSaveBtn(
              onPressed: () {
                var notifier = ref.read(profileStateNotifierProvider.notifier);
                List<Skill> skills = widget.skills;
                if (widget.currentIndex == null) {
                  skills.add(Skill(name: skillController.text.trim()));
                } else {
                  skills[widget.currentIndex!] = Skill(name: skillController.text.trim());
                }
                notifier.addSkills(skills);
              },
            ),
          ],
        ),
      ),
    );
  }
}
