import 'package:flutter/material.dart';
class LanguageDetailFluencyField extends StatelessWidget {
  const LanguageDetailFluencyField({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverToBoxAdapter(
        child: DropdownButtonFormField(
          items: [
            DropdownMenuItem(value: 'b', child: Text('Beginner')),
            DropdownMenuItem(value: 'n', child: Text('Native')),
            DropdownMenuItem(value: 'f', child: Text('Fluent')),
            DropdownMenuItem(value: 'i', child: Text('Intermediate')),
          ],
          dropdownColor: Theme.of(context).colorScheme.onSecondary,
          isExpanded: true,
          value: 'b',
          onChanged: (value) {},
          style: TextStyle(
            fontFamily: 'Urbanist',
            color: Theme.of(context).colorScheme.surface,
            fontWeight: FontWeight.w700,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            hintText: 'Enter language name here...',
            hintStyle: TextStyle(
              fontFamily: 'Urbanist',
              color: Theme.of(context).colorScheme.surface.withAlpha(130),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
