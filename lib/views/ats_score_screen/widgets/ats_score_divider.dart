import 'package:flutter/material.dart';

class AtsScoreDivider extends StatelessWidget {
  const AtsScoreDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10),
      sliver: SliverToBoxAdapter(
        child: Divider(
          color: Theme.of(context).colorScheme.primary.withAlpha(150),
          indent: 12,
          endIndent: 12,
        ),
      ),
    );
  }
}
