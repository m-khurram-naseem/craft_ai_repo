import 'package:craft_ai/utils/comman_widgets/no_data_found_widget.dart';
import 'package:craft_ai/views/education_detail_edit_screen/education_detail_edit_screen.dart';
import 'package:craft_ai/views/education_detail_screen/widgets/education_detail_add_btn.dart';
import 'package:craft_ai/views/education_detail_screen/widgets/education_detail_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EducationDetailScreen extends StatelessWidget {
  final String title;
  const EducationDetailScreen({super.key, required this.title});

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
          title == 'Education'
              ? Center(
                child: NoDataFoundWidget(errorMessage: 'No Education Found'),
              )
              : Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomScrollView(
                      slivers: [
                        for (var i = 0; i < 4; i++)
                          EducationDetailTile(
                            title: 'BS Software Engineering',
                            subtitle: 'The Islamia University, Bahawalpur',
                            onEditTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder:
                                      (context) => EducationDetailEditScreen(
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
                    EducationDetailAddBtn(),
                  ],
                ),
              ),
      floatingActionButton:
          title == 'Education'
              ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder:
                          (context) =>
                              EducationDetailEditScreen(isUpdate: false),
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
