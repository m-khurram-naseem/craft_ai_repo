import 'package:flutter/material.dart';

class LinkDetailFluencyField extends StatelessWidget {
  const LinkDetailFluencyField({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverToBoxAdapter(
        child: DropdownButtonFormField(
          items: [
            DropdownMenuItem(
              value: 'l',
              child: Text(
                'Linked In',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'i',
              child: Text(
                'Instagram',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'f',
              child: Text(
                'Facebook',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'p',
              child: Text(
                'Personal Website',
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
          value: 'l',
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

