
import 'package:craft_ai/models/work_experience.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreenWorkExperienceTile extends StatelessWidget {
  final bool isTopRounded;
  final bool isBottomRounded;
  final WorkExperience experience;
  const ProfileScreenWorkExperienceTile({
    super.key,
    required this.experience,
    this.isTopRounded = false,
    this.isBottomRounded = false,
  });

  @override
  Widget build(BuildContext context) {
    
    return ProfileScreenTile(
      title: experience.jobRole,
      subtitle: '${experience.companyName}, ${experience.companyAddress}',
      trailing: Image.asset(
        'assets/icons/arrow_forward.png',
        width: 23,
        color: Theme.of(context).colorScheme.primary,
      ),
      isBottomRounded: isBottomRounded,
      isTopRounded: isTopRounded,
      onTap: () {
        showCupertinoSheet(
          context: context,
          pageBuilder: (context) {
            return Container(color: Theme.of(context).colorScheme.onSecondary);
          },
        );
      },
    );
  }
}
