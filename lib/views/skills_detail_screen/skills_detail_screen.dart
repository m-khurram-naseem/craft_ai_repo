import 'package:craft_ai/controllers/profile_state_notifier/profile_providers.dart';
import 'package:craft_ai/utils/comman_widgets/no_data_found_widget.dart';
import 'package:craft_ai/views/skill_detail_edit_screen/skill_detail_edit_screen.dart';
import 'package:craft_ai/views/skills_detail_screen/widgets/skill_detail_add_btn.dart';
import 'package:craft_ai/views/skills_detail_screen/widgets/skill_detail_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child:
            skills.isEmpty
                ? NoDataFoundWidget(errorMessage: 'No Skills Found')
                : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SkillsDetailList(),
                    SkillDetailAddBtn(
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder:
                                (context) =>
                                    SkillDetailEditScreen(isUpdate: false ,skills: skills,),
                          ),
                        );
                      },
                    ),
                  ],
                ),
      ),
      floatingActionButton:
          skills.isEmpty
              ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder:
                          (context) => SkillDetailEditScreen(isUpdate: false , skills: skills,),
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


class SkillsDetailList extends ConsumerWidget {
  const SkillsDetailList({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    var state = ref.watch(profileStreamProvider);
    return state.when(data: (userData) {
      return CustomScrollView(
                      slivers: [
                        for (var i = 0; i < userData.skills.length; i++)
                          SkillDetailTile(
                            title: userData.skills[i],
                            onEditTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder:
                                      (context) =>
                                          SkillDetailEditScreen(isUpdate: true, skills: userData.skills , currentIndex: i,),
                                ),
                              );
                            },
                            trailing: Icon(
                              Icons.edit_outlined,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            isTopRounded: i == 0,
                            isBottomRounded: i == userData.skills.length - 1,
                          ),
                      ],
                    );
    },loading: () {
      return Center(
                  child: LoadingAnimationWidget.threeRotatingDots(
                    color: Theme.of(context).colorScheme.primary,
                    size: 25,
                  ),
                );
    },error: (error, stackTrace) {
      return SizedBox();
    },skipLoadingOnRefresh: true);    
  }
}