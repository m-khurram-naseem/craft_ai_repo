import 'package:flutter/material.dart';

class AtsScoreInsightsList extends StatelessWidget {
  const AtsScoreInsightsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: 3, (context, index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
          child: ListTile(
            style: ListTileStyle.list,
            // tileColor: Theme.of(context).colorScheme.onSecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            leading: Icon(
              Icons.check_box_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Matched 3 out of 4 required skills. Matched 3 out of 4 required skills.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,

                fontFamily: 'Uranist',
              ),
            ),
          ),
        );
      }),
    );
  }
}
