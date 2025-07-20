import 'package:craft_ai/models/link.dart';
import 'package:craft_ai/views/links_detail_edit_screen/links_detail_edit_screen.dart';
import 'package:craft_ai/views/links_detail_edit_screen/widgets/link_detail_fluency_field.dart';
import 'package:craft_ai/views/links_detail_screen/widgets/links_detail_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinksDetailList extends StatelessWidget {
  final List<Link> links;
  const LinksDetailList({super.key, required this.links});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        for (var i = 0; i < links.length; i++)
          LinksDetailTile(
            title: getLinkNameFromIndex(links[i].name),
            subtitle: links[i].url,
            trailing: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.edit_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            onEditTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder:
                      (context) =>
                          LinksDetailEditScreen(links: links, currentIndex: i),
                ),
              );
            },
            isTopRounded: i == 0,
            isBottomRounded: i == links.length - 1,
          ),
      ],
    );
  }
}
