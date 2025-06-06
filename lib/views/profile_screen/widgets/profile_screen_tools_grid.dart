import 'package:flutter/material.dart';

class ProfileScreenToolsGrid extends StatelessWidget {
  const ProfileScreenToolsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverGrid(
        delegate: SliverChildListDelegate([
          for (var i = 0; i < tools.length; i++)
            ProfileScreenToolsTile(
              skillName: tools[i],
              index: i,
              noOfSkills: tools.length,
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

class ProfileScreenToolsTile extends StatelessWidget {
  final String skillName;
  final int noOfSkills, index;
  const ProfileScreenToolsTile({
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
          bottomLeft: Radius.circular(index == tools.length - 2 ? 15 : 0),
          bottomRight: Radius.circular(index == tools.length - 1 ? 15 : 0),
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

var tools = [
  'Android Studio',
  'VS Code',
  'IntelliJ',
  'Pycharm',
  'TensorFlow Playground',
  'Jupyter Notebook',
  'Anaconda',
  '',
];
