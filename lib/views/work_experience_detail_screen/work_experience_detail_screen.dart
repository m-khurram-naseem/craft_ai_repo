import 'package:craft_ai/utils/comman_widgets/no_data_found_widget.dart';
import 'package:craft_ai/views/work_experience_detail_screen/widgets/work_experience_add_btn.dart';
import 'package:craft_ai/views/work_experience_detail_screen/widgets/work_experience_tile.dart';
import 'package:craft_ai/views/work_experience_edit_screen/work_expreicne_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkExperienceDetailScreen extends StatelessWidget {
  final String title;
  const WorkExperienceDetailScreen({super.key, required this.title});

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
            title == 'Work Experience'
                ? NoDataFoundWidget(errorMessage: 'No Experience Found')
                : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomScrollView(
                      slivers: [
                        for (var i = 0; i < 4; i++)
                          WorkExperienceTile(
                            title: 'Software Engineer',
                            subtitle: 'Bisconi Private Ltd, Islamabad',
                            onEditTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder:
                                      (context) => WorkExpreicneEditScreen(
                                        isUpdate: true,
                                      ),
                                ),
                              );
                            },
                            trailing: Icon(
                              Icons.edit_outlined,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            isTopRounded: i == 0,
                            isBottomRounded: i == 3,
                          ),
                      ],
                    ),
                    WorkExperienceAddBtn(),
                  ],
                ),
      ),
      floatingActionButton:
          title == 'Work Experience'
              ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder:
                          (context) => WorkExpreicneEditScreen(isUpdate: false),
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
