import 'package:craft_ai/controllers/profile_state_notifier/profile_providers.dart';
import 'package:craft_ai/controllers/profile_state_notifier/profile_states.dart';
import 'package:craft_ai/views/skill_detail_edit_screen/widgets/skill_detail_edit_field.dart';
import 'package:craft_ai/views/skill_detail_edit_screen/widgets/skill_detail_save_btn.dart';
import 'package:craft_ai/views/skill_detail_edit_screen/widgets/skill_detail_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SkillDetailEditScreen extends ConsumerStatefulWidget {
  final bool isUpdate;
  final List<String> skills;
  final int? currentIndex;
  const SkillDetailEditScreen({super.key, required this.isUpdate , required this.skills , this.currentIndex,});

  @override
  ConsumerState<SkillDetailEditScreen> createState() => _SkillDetailEditScreenState();
}

class _SkillDetailEditScreenState extends ConsumerState<SkillDetailEditScreen> {
  late TextEditingController skillController;
  bool isDialogShown = false;

  @override
  void initState() {   
    super.initState();
    String? skill;
    if(widget.currentIndex != null){
      skill = widget.skills[widget.currentIndex!];
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
    ref.listen(profileStateNotifierProvider , (previous, next) {
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
    },onError: (error, stackTrace) {
      
    },);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isUpdate ? 'Update Skill' : 'Add Skill',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [SkillDetailText(), SkillDetailEditField(controller: skillController,)],
            ),
            SkillDetailSaveBtn(onPressed: () {
              var notifier = ref.read(profileStateNotifierProvider.notifier);
              List<String> skills = widget.skills;
              if(widget.currentIndex == null){
                skills.add(skillController.text.trim());
              }else{                
                skills[widget.currentIndex!] = skillController.text.trim();                
              }
              notifier.addSkills(skills);
            },),
          ],
        ),
      ),
    );
  }
}
