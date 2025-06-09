import 'package:craft_ai/controllers/profile_state_notifier/profile_providers.dart';
import 'package:craft_ai/models/education.dart';
import 'package:craft_ai/utils/comman_widgets/no_data_found_widget.dart';
import 'package:craft_ai/views/education_detail_edit_screen/education_detail_edit_screen.dart';
import 'package:craft_ai/views/education_detail_screen/widgets/education_detail_add_btn.dart';
import 'package:craft_ai/views/education_detail_screen/widgets/education_detail_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EducationDetailScreen extends StatelessWidget {
  final String title;
  final List<Education> education;
  const EducationDetailScreen({
    super.key,
    required this.title,
    required this.education,
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
      body:
          education.isEmpty
              ? Center(
                child: NoDataFoundWidget(errorMessage: 'No Education Found'),
              )
              : Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    EducationDetailList(),
                    EducationDetailAddBtn(
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder:
                                (context) => EducationDetailEditScreen(
                                  isUpdate: false,
                                  eduacation: education,
                                ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
      floatingActionButton:
          education.isEmpty
              ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder:
                          (context) => EducationDetailEditScreen(
                            isUpdate: false,
                            eduacation: education,
                          ),
                    ),
                  );
                },
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                foregroundColor: Theme.of(context).colorScheme.surface,
                heroTag: 'Education',
                elevation: 1,
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.surface,
                ),
                label: Text(
                  'Add Education',
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


class EducationDetailList extends ConsumerWidget {
  const EducationDetailList({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    var state = ref.watch(profileStreamProvider);
    return state.when(data: (userData) {
      return CustomScrollView(
                      slivers: [
                        for (var i = 0; i < userData.education.length; i++)
                          EducationDetailTile(
                            title: userData.education[i].degreeName,
                            subtitle:
                                '${userData.education[i].instituteName}, ${userData.education[i].instituteAddress}',
                            onEditTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder:
                                      (context) => EducationDetailEditScreen(
                                        isUpdate: true,
                                        eduacation: userData.education,
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
                            isBottomRounded: i == userData.education.length - 1,                            
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