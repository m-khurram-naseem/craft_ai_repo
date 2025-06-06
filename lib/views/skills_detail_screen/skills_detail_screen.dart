import 'package:craft_ai/utils/comman_widgets/no_data_found_widget.dart';
import 'package:craft_ai/views/skill_detail_edit_screen/skill_detail_edit_screen.dart';
import 'package:craft_ai/views/skills_detail_screen/widgets/skill_detail_add_btn.dart';
import 'package:craft_ai/views/skills_detail_screen/widgets/skill_detail_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkillsDetailScreen extends StatelessWidget {
  final String title;
  final List<String> skills;
  const SkillsDetailScreen({
    super.key,
    required this.title,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    // skills.removeWhere((element) => element.isEmpty);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child:
            title == 'Skills'
                ? NoDataFoundWidget(errorMessage: 'No Skills Found')
                : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomScrollView(
                      slivers: [
                        for (
                          var i = 0;
                          i <
                              skills
                                  .where((element) => element.isNotEmpty)
                                  .length;
                          i++
                        )
                          SkillDetailTile(
                            title: skills[i],
                            onEditTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder:
                                      (context) =>
                                          SkillDetailEditScreen(isUpdate: true),
                                ),
                              );
                            },
                            trailing: Icon(
                              Icons.edit_outlined,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            isTopRounded: i == 0,
                            isBottomRounded:
                                i ==
                                skills
                                        .where((element) => element.isNotEmpty)
                                        .length -
                                    1,
                          ),
                      ],
                    ),
                    SkillDetailAddBtn(),
                  ],
                ),
      ),
      floatingActionButton:
          title == 'Skills'
              ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder:
                          (context) => SkillDetailEditScreen(isUpdate: false),
                    ),
                  );
                },
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                foregroundColor: Theme.of(context).colorScheme.surface,
                heroTag: 'Skills',
                elevation: 1,
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.surface,
                ),
                label: Text(
                  'Add Skill',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              )
              : null,
    );
  }
}
