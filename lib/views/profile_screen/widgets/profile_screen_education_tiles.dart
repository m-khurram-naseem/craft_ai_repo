import 'package:craft_ai/models/education.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreenEducationTile extends StatelessWidget {
  final bool isTopRounded;
  final bool isBottomRounded;
  final Education education;
  const ProfileScreenEducationTile({
    super.key,
    required this.education,
    this.isTopRounded = false,
    this.isBottomRounded = false,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileScreenTile(
      title: education.degreeName,
      subtitle: '${education.instituteName}, ${education.instituteAddress}',
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
