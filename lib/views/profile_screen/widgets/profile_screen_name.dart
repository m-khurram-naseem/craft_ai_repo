import 'package:flutter/material.dart';

class ProfileScreenName extends StatelessWidget {
  final String name;
  const ProfileScreenName({super.key , required this.name});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Urbanist',
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),
          ),
        );
  }
}