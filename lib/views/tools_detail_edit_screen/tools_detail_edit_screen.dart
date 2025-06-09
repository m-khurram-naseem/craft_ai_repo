import 'package:craft_ai/controllers/profile_state_notifier/profile_providers.dart';
import 'package:craft_ai/controllers/profile_state_notifier/profile_states.dart';
import 'package:craft_ai/views/tools_detail_edit_screen/widgets/tools_detail_edit_field.dart';
import 'package:craft_ai/views/tools_detail_edit_screen/widgets/tools_detail_edit_text.dart';
import 'package:craft_ai/views/tools_detail_edit_screen/widgets/tools_detail_save_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ToolsDetailEditScreen extends ConsumerStatefulWidget {
  final bool isUpdate;
  final List<String> tools;
  final int? currentIndex;
  const ToolsDetailEditScreen({
    super.key,
    required this.isUpdate,
    required this.tools,
    this.currentIndex,
  });

  @override
  ConsumerState<ToolsDetailEditScreen> createState() =>
      _ToolsDetailEditScreenState();
}

class _ToolsDetailEditScreenState extends ConsumerState<ToolsDetailEditScreen> {
  late TextEditingController toolController;
  bool isDialogShown = false;

  @override
  void initState() {
    super.initState();
    String? currentTool;
    if (widget.currentIndex != null) {
      currentTool = widget.tools[widget.currentIndex!];
    }
    toolController = TextEditingController(text: currentTool);
  }

  @override
  void dispose() {
    toolController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(profileStateNotifierProvider, (previous, next) {
      if (next is ProfileLoadingState) {
        if (!isDialogShown) {
          isDialogShown = true;
          showDialog(
            context: context,
            builder: (context) {
              return Dialog.fullscreen(
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.onSecondary.withAlpha(80),
                child: Center(
                  child: LoadingAnimationWidget.threeRotatingDots(
                    color: Theme.of(context).colorScheme.primary,
                    size: 25,
                  ),
                ),
              );
            },
          );
        }
      } else if (next is ProfileLoadedState || next is ProfileErrorState) {
        if (isDialogShown) {
          Navigator.of(context)
            ..pop()
            ..pop();
          isDialogShown = false;
        }
      }
    }, onError: (error, stackTrace) {});
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isUpdate ? 'Update Tool' : 'Add Tool',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                ToolsDetailEditText(),
                ToolsDetailEditField(controller: toolController),
              ],
            ),
            ToolsDetailSaveBtn(
              onPressed: () {
                var notifier = ref.read(profileStateNotifierProvider.notifier);
                List<String> updatedTools = widget.tools;
                if (widget.currentIndex == null) {
                  updatedTools.add(toolController.text.trim());
                } else {
                  updatedTools[widget.currentIndex!] =
                      toolController.text.trim();
                }
                notifier.addTools(updatedTools);
              },
            ),
          ],
        ),
      ),
    );
  }
}
