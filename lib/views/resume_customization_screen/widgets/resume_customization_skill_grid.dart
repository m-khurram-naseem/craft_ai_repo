import 'package:craft_ai/models/skill.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_base_tile.dart';
import 'package:flutter/material.dart';

class ResumeCustomizationSkillsTile extends StatelessWidget {
  final bool isTopRounded;
  final bool isBottomRounded;
  final Skill skill;
  final bool isExist;
  final void Function(Skill skill) onAddTap;
  final void Function(Skill skill) onDeleteTap;
  const ResumeCustomizationSkillsTile({
    super.key,
    required this.skill,
    required this.isTopRounded,
    required this.isBottomRounded,
    required this.isExist,
    required this.onAddTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return ResumeCustomizationBaseTile(
      title: skill.name,
      trailing: isExist
              ? GestureDetector(
                onTap: () {
                  onDeleteTap(skill);
                },
                child: Image.asset(
                  'assets/icons/delete.png',
                  width: 23,
                  color: Colors.red.withAlpha(200),
                ),
              )
              : GestureDetector(
                onTap: () {
                  onAddTap(skill);
                },
                child: Image.asset(
                  'assets/icons/plus.png',
                  width: 21,
                  color: Theme.of(context).colorScheme.primary.withAlpha(200),
                ),
              ),
      leading: Icon(
        Icons.circle,
        size: 8,
        color: Theme.of(context).colorScheme.primary,
      ),
      isBottomRounded: isBottomRounded,
      isTopRounded: isTopRounded,
      
    );
  }
}
