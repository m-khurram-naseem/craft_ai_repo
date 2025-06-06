import 'package:flutter/material.dart';

class ToolsDetailEditText extends StatelessWidget {
  const ToolsDetailEditText({super.key});

  @override
  Widget build(BuildContext context) {
    return  SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Tool Name',
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