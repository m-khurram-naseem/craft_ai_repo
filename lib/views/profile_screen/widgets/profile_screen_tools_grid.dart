import 'package:flutter/material.dart';

class ProfileScreenToolsGrid extends StatelessWidget {
  final List<String> tools;
  const ProfileScreenToolsGrid({super.key , required this.tools});

  @override
  Widget build(BuildContext context) {
    var updatedTools = [...tools];
    if(updatedTools.length.isOdd){
      updatedTools.add('');
    }
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverGrid(
        delegate: SliverChildListDelegate([
          for (var i = 0; i < updatedTools.length; i++)
            ProfileScreenToolsTile(
              skillName: updatedTools[i],
              index: i,
              noOfTools: updatedTools.length,
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
  final int noOfTools, index;
  const ProfileScreenToolsTile({
    super.key,
    required this.skillName,
    required this.noOfTools,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(index == 0 ? 15 : 0),
          topRight: Radius.circular(index == 1 ? 15 : 0),
          bottomLeft: Radius.circular(index == noOfTools - 2 ? 15 : 0),
          bottomRight: Radius.circular(index == noOfTools - 1 ? 15 : 0),
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