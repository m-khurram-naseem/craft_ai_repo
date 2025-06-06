import 'package:flutter/material.dart';

class ProfileScreenSkillsGrid extends StatelessWidget {
  const ProfileScreenSkillsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverGrid(
        delegate: SliverChildListDelegate([
          for (var i = 0; i < skills.length; i++)
            ProfileScreenSkillsTile(
              skillName: skills[i],
              index: i,
              noOfSkills: skills.length,
            ),
        ]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 3,
          mainAxisExtent: 52,
        ),
      ),
    );
  }
}

class ProfileScreenSkillsTile extends StatelessWidget {
  final String skillName;
  final int noOfSkills, index;
  const ProfileScreenSkillsTile({
    super.key,
    required this.skillName,
    required this.noOfSkills,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(index == 0 ? 15 : 0),
          topRight: Radius.circular(index == 1 ? 15 : 0),
          bottomLeft: Radius.circular(index == skills.length - 2 ? 15 : 0),
          bottomRight: Radius.circular(index == skills.length - 1 ? 15 : 0),
        ),
      ),
      tileColor: Theme.of(context).colorScheme.onSecondary,
      leading:
          skillName.isNotEmpty
              ? Icon(
                Icons.circle,
                size: 8,
                color: Theme.of(context).colorScheme.primary,
              )
              : null,
      title: Text(
        skillName,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

var skills = [
  'Java',
  'Android',
  'Dart',
  'Flutter',
  'Python',
  'TensorFlow',
  'Keras',
  '',
];
