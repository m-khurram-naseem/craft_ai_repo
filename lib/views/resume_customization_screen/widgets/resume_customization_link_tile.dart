import 'package:craft_ai/models/link.dart';
import 'package:craft_ai/views/links_detail_edit_screen/widgets/link_detail_fluency_field.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_base_tile.dart';
import 'package:flutter/material.dart';

class ResumeCustomizationLinkTile extends StatelessWidget {
  final Link link;
  final bool isTopRounded;
  final bool isBottomRounded;
      final bool isExist;
  final void Function(Link link) onAddTap;
  final void Function(Link link) onDeleteTap;
  const ResumeCustomizationLinkTile({
    super.key,
   
    required this.link,
    this.isTopRounded = false,
    this.isBottomRounded = false,
            required this.isExist,
    required this.onAddTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return ResumeCustomizationBaseTile(
      title: getLinkNameFromIndex(link.name),
      subtitle: link.url,
      trailing: isExist
              ? GestureDetector(
                onTap: () {
                  onDeleteTap(link);
                },
                child: Image.asset(
                  'assets/icons/delete.png',
                  width: 23,
                  color: Colors.red.withAlpha(200),
                ),
              )
              : GestureDetector(
                onTap: () {
                  onAddTap(link);
                },
                child: Image.asset(
                  'assets/icons/plus.png',
                  width: 21,
                  color: Theme.of(context).colorScheme.primary.withAlpha(200),
                ),
              ),
      isBottomRounded: isBottomRounded,
      isTopRounded: isTopRounded,
      
    );
  }
}
