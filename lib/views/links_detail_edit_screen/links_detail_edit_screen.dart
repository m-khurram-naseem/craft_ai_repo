import 'package:craft_ai/controllers/profile_controller/profile_providers.dart';
import 'package:craft_ai/controllers/profile_controller/profile_states.dart';
import 'package:craft_ai/models/link.dart';
import 'package:craft_ai/views/links_detail_edit_screen/widgets/link_detail_edit_field.dart';
import 'package:craft_ai/views/links_detail_edit_screen/widgets/link_detail_fluency_field.dart';
import 'package:craft_ai/views/links_detail_edit_screen/widgets/link_detail_save_btn.dart';
import 'package:craft_ai/views/links_detail_edit_screen/widgets/link_detail_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LinksDetailEditScreen extends ConsumerStatefulWidget {
  final int? currentIndex;
  final List<Link> links;
  const LinksDetailEditScreen({
    super.key,
    this.currentIndex,
    required this.links,
  });

  @override
  ConsumerState<LinksDetailEditScreen> createState() =>
      _LinksDetailEditScreenState();
}

class _LinksDetailEditScreenState extends ConsumerState<LinksDetailEditScreen> {
  late TextEditingController linkController;
  int currentValue = 0;
  bool isDialogShown = false;

  @override
  void initState() {
    super.initState();
    Link? link;
    if (widget.currentIndex != null) {
      link = widget.links[widget.currentIndex!];
      currentValue = link.name;
    }
    linkController = TextEditingController(text: link?.url);
  }

  @override
  void dispose() {
    linkController.dispose();
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
          widget.currentIndex != null ? 'Update Link' : 'Add Link',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
        actions: [
          if (widget.currentIndex != null)
            GestureDetector(
              onTap: () {
                var updatedLinks = [...widget.links];
                updatedLinks.remove(updatedLinks[widget.currentIndex!]);
                ref
                    .read(profileStateNotifierProvider.notifier)
                    .addLinks(updatedLinks);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/icons/delete.png',
                  width: 22,
                  color: Colors.red,
                ),
              ),
            ),
        ],
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                LinkDetailText(text: 'Platform'),
                LinkDetailNameField(
                  initialValue: currentValue,
                  onChanged: (value) {
                    if (value != null) {
                      currentValue = value;
                    }
                  },
                ),
                LinkDetailText(text: 'Link'),
                LinkDetailLinkField(controller: linkController),
              ],
            ),
            LinkDetailSaveBtn(
              onPressed: () {
                List<Link> updatedLinks = [...widget.links];
                var link = Link(
                  url: linkController.text.trim(),
                  name: currentValue,
                );
                if (widget.currentIndex == null) {
                  updatedLinks.add(link);
                } else {
                  updatedLinks[widget.currentIndex!] = link;
                }
                ref
                    .read(profileStateNotifierProvider.notifier)
                    .addLinks(updatedLinks);
              },
            ),
          ],
        ),
      ),
    );
  }
}
