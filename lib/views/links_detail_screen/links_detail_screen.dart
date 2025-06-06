import 'package:craft_ai/utils/comman_widgets/no_data_found_widget.dart';
import 'package:craft_ai/views/links_detail_edit_screen/links_detail_edit_screen.dart';
import 'package:craft_ai/views/links_detail_screen/widgets/links_detail_add_btn.dart';
import 'package:craft_ai/views/links_detail_screen/widgets/links_detail_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinksDetailScreen extends StatelessWidget {
  final String title;
  const LinksDetailScreen({super.key, required this.title});

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
            title == 'Social Links'
                ? NoDataFoundWidget(errorMessage: 'No Links Found')
                : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomScrollView(
                      slivers: [
                        for (var i = 0; i < 3; i++)
                          LinksDetailTile(
                            title: 'Linked In',
                            subtitle:
                                'https://www.linkedin.com/in/m-khuram-naseem',
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
                                          LinksDetailEditScreen(isUpdate: true),
                                ),
                              );
                            },
                            isTopRounded: i == 0,
                            isBottomRounded: i == 2,
                          ),
                      ],
                    ),
                    LinksDetailAddBtn(),
                  ],
                ),
      ),
      floatingActionButton:
          title == 'Social Links'
              ? FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder:
                          (context) => LinksDetailEditScreen(isUpdate: false),
                    ),
                  );
                },
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                foregroundColor: Theme.of(context).colorScheme.surface,
                heroTag: 'SocailLinks',
                elevation: 1,
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.surface,
                ),
                label: Text(
                  'Add Link',
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
