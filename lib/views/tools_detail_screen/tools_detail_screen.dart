import 'package:craft_ai/controllers/profile_state_notifier/profile_providers.dart';
import 'package:craft_ai/utils/comman_widgets/no_data_found_widget.dart';
import 'package:craft_ai/views/skills_detail_screen/widgets/skill_detail_tile.dart';
import 'package:craft_ai/views/tools_detail_edit_screen/tools_detail_edit_screen.dart';
import 'package:craft_ai/views/tools_detail_screen/widgets/tools_detail_add_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child:
            tools.isEmpty
                ? NoDataFoundWidget(errorMessage: 'No Tools Found')
                : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ToolsDetailList(),
                    ToolsDetailAddBtn(
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder:
                                (context) => ToolsDetailEditScreen(
                                  isUpdate: false,
                                  tools: tools,
                                ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
      ),
      floatingActionButton:
          tools.isEmpty
              ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder:
                          (context) => ToolsDetailEditScreen(
                            isUpdate: false,
                            tools: tools,
                          ),
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

class ToolsDetailList extends ConsumerWidget {
  const ToolsDetailList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(profileStreamProvider);
    return state.when(
      data: (userData) {
        return CustomScrollView(
          slivers: [
            for (var i = 0; i < userData.tools.length; i++)
              SkillDetailTile(
                title: userData.tools[i],
                onEditTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder:
                          (context) => ToolsDetailEditScreen(
                            isUpdate: true,
                            tools: userData.tools,
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
                isBottomRounded: i == userData.tools.length - 1,
              ),
          ],
        );
      },
      loading: () {
        return Center(
          child: LoadingAnimationWidget.threeRotatingDots(
            color: Theme.of(context).colorScheme.primary,
            size: 25,
          ),
        );
      },
      error: (error, stackTrace) {
        return SizedBox();
      },
      skipLoadingOnRefresh: true,
    );
  }
}
