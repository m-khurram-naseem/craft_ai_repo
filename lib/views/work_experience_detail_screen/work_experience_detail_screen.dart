import 'package:craft_ai/controllers/profile_state_notifier/profile_providers.dart';
import 'package:craft_ai/models/work_experience.dart';
import 'package:craft_ai/utils/comman_widgets/no_data_found_widget.dart';
import 'package:craft_ai/views/work_experience_detail_screen/widgets/work_experience_add_btn.dart';
import 'package:craft_ai/views/work_experience_detail_screen/widgets/work_experience_tile.dart';
import 'package:craft_ai/views/work_experience_edit_screen/work_expreicne_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WorkExperienceDetailScreen extends StatelessWidget {
  final String title;
  final List<WorkExperience> workExperiences;

  const WorkExperienceDetailScreen({
    super.key,
    required this.title,
    required this.workExperiences,
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
            workExperiences.isEmpty
                ? NoDataFoundWidget(errorMessage: 'No Experience Found')
                : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    WorkExperienceList(),
                    WorkExperienceAddBtn(
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder:
                                (context) => WorkExpreicneEditScreen(
                                  isUpdate: false,
                                  workExperiences: workExperiences,
                                ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
      ),
      floatingActionButton:
          workExperiences.isEmpty
              ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder:
                          (context) => WorkExpreicneEditScreen(
                            isUpdate: false,
                            workExperiences: workExperiences,
                          ),
                    ),
                  );
                },
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                foregroundColor: Theme.of(context).colorScheme.surface,
                heroTag: 'WorkExperience',
                elevation: 1,
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.surface,
                ),
                label: Text(
                  'Add Experience',
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

class WorkExperienceList extends ConsumerWidget { 
  const WorkExperienceList({super.key,});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    var state = ref.watch(profileStreamProvider);
    return state.when(data: (userData) {
      return CustomScrollView(
      slivers: [
        for (var i = 0; i < userData.workExperience.length; i++)
          WorkExperienceTile(
            title: userData.workExperience[i].jobRole,
            subtitle:
                '${userData.workExperience[i].companyName}, ${userData.workExperience[i].companyAddress}',
            onEditTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder:
                      (context) => WorkExpreicneEditScreen(
                        isUpdate: true,
                        workExperiences: userData.workExperience,
                        currentIndex: i,
                      ),
                ),
              );
            },
            trailing: Icon(
              Icons.edit_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            isTopRounded: i == 0,
            isBottomRounded: i == userData.workExperience.length - 1,
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
