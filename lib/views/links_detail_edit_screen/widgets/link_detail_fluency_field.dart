import 'package:flutter/material.dart';

class LinkDetailNameField extends StatelessWidget {
  final ValueChanged<int?> onChanged;
  final int initialValue;
  const LinkDetailNameField({super.key , required this.onChanged , required this.initialValue});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverToBoxAdapter(
        child: DropdownButtonFormField(
          items: [
            DropdownMenuItem(
              value: 0,
              child: Text(
                getLinkNameFromIndex(0),
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 1,
              child: Text(
                getLinkNameFromIndex(1),
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 2,
              child: Text(
                getLinkNameFromIndex(2),
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 3,
              child: Text(
                getLinkNameFromIndex(3),
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
          dropdownColor: Theme.of(context).colorScheme.onSecondary,
          isExpanded: true,
          value: initialValue,
          onChanged: onChanged,
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

String getLinkNameFromIndex(int index){
  return switch(index){
    0 => 'Linked In',
    1 => 'Github',
    2 => 'Instagram',
    3 => 'Personal Website',
    _ => '',
  };
}