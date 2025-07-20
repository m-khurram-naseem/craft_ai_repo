import 'package:craft_ai/models/work_experience.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_base_tile.dart';
import 'package:flutter/material.dart';

class ResumeCustomizationExperienceTile extends StatelessWidget {
  final bool isTopRounded;
  final bool isBottomRounded;
  final WorkExperience experience;
  final bool isExist;
  final void Function(WorkExperience experience) onAddTap;
  final void Function(WorkExperience experience) onDeleteTap;
  const ResumeCustomizationExperienceTile({
    super.key,
    required this.experience,
    this.isTopRounded = false,
    this.isBottomRounded = false,
    required this.onAddTap,
    required this.onDeleteTap,
    required this.isExist,
  });

  @override
  Widget build(BuildContext context) {
    return ResumeCustomizationBaseTile(
      title: experience.jobRole,
      subtitle: '${experience.companyName}, ${experience.companyAddress}',
      trailing:
          isExist
              ? GestureDetector(
                onTap: () {
                  onDeleteTap(experience);
                },
                child: Image.asset(
                  'assets/icons/delete.png',
                  width: 23,
                  color: Colors.red.withAlpha(200),
                ),
              )
              : GestureDetector(
                onTap: () {
                  onAddTap(experience);
                },
                child: Image.asset(
                  'assets/icons/plus.png',
                  width: 21,
                  color: Theme.of(context).colorScheme.primary.withAlpha(200),
                ),
              ),
      isBottomRounded: isBottomRounded,
      isTopRounded: isTopRounded,
      
    );
  }
}
