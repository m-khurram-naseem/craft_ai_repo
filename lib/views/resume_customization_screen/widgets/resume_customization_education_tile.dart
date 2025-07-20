import 'package:craft_ai/models/education.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_base_tile.dart';
import 'package:flutter/material.dart';

class ResumeCustomizationEducationTile extends StatelessWidget {
  final bool isTopRounded;
  final bool isBottomRounded;
  final Education education;
  final bool isExist;
  final void Function(Education education) onAddTap;
  final void Function(Education education) onDeleteTap;
  const ResumeCustomizationEducationTile({
    super.key,
    required this.education,
    this.isTopRounded = false,
    this.isBottomRounded = false,
    required this.isExist,
    required this.onAddTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return ResumeCustomizationBaseTile(
      title: education.degreeName,
      subtitle: '${education.instituteName}, ${education.instituteAddress}',
      trailing:
          isExist
              ? GestureDetector(
                onTap: () {
                  onDeleteTap(education);
                },
                child: Image.asset(
                  'assets/icons/delete.png',
                  width: 23,
                  color: Colors.red.withAlpha(200),
                ),
              )
              : GestureDetector(
                onTap: () {
                  onAddTap(education);
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
