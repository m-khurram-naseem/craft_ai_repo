import 'package:flutter/material.dart';

class WorkExperienceText extends StatelessWidget {
  final String text;
  const WorkExperienceText({super.key , required this.text});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  text,
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