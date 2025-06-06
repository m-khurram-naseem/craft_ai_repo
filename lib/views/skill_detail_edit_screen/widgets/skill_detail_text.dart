import 'package:flutter/material.dart';

class SkillDetailText extends StatelessWidget {
  const SkillDetailText({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Skill Name',
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