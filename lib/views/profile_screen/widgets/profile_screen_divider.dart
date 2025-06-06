import 'package:flutter/material.dart';

class ProfileScreenDivider extends StatelessWidget {
  const ProfileScreenDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
              child: Divider(
                color: Theme.of(context).colorScheme.primary.withAlpha(150),
                indent: 12,
                endIndent: 12,
              ),
            );
  }
}