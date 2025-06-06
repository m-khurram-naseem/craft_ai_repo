import 'package:flutter/material.dart';

class AtsScoreRecommendationsList extends StatelessWidget {
  const AtsScoreRecommendationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: 5, (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
          child: ListTile(
            // tileColor: Theme.of(context).colorScheme.onSecondary,
            style: ListTileStyle.list,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            leading: Icon(
              Icons.earbuds_sharp,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Include details about team leadership, roles, or collaborative work environments.',
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
