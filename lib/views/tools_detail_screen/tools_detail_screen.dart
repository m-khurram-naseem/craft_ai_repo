import 'package:craft_ai/utils/comman_widgets/no_data_found_widget.dart';
import 'package:craft_ai/views/skills_detail_screen/widgets/skill_detail_tile.dart';
import 'package:craft_ai/views/tools_detail_edit_screen/tools_detail_edit_screen.dart';
import 'package:craft_ai/views/tools_detail_screen/widgets/tools_detail_add_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToolsDetailScreen extends StatelessWidget {
  final String title;
  final List<String> tools;
  const ToolsDetailScreen({
    super.key,
    required this.title,
    required this.tools,
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
            title == 'Tools'
                ? NoDataFoundWidget(errorMessage: 'No Tools Found')
                : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomScrollView(
                      slivers: [
                        for (
                          var i = 0;
                          i <
                              tools
                                  .where((element) => element.isNotEmpty)
                                  .length;
                          i++
                        )
                          SkillDetailTile(
                            title: tools[i],
                            onEditTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder:
                                      (context) =>
                                          ToolsDetailEditScreen(isUpdate: true),
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
                                tools
                                        .where((element) => element.isNotEmpty)
                                        .length -
                                    1,
                          ),
                      ],
                    ),
                    ToolsDetailAddBtn(),
                  ],
                ),
      ),
      floatingActionButton:
          title == 'Tools'
              ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder:
                          (context) => ToolsDetailEditScreen(isUpdate: false),
                    ),
                  );
                },
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                foregroundColor: Theme.of(context).colorScheme.surface,
                heroTag: 'Tools',
                elevation: 1,
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.surface,
                ),
                label: Text(
                  'Add Tool',
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
