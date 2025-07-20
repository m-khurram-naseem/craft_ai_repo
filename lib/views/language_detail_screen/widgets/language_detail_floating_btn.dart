
import 'package:flutter/material.dart';

class LanguageDetailFloatingBtn extends StatelessWidget {  
  final VoidCallback onPressed;
  const LanguageDetailFloatingBtn({super.key , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
                onPressed: onPressed,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                foregroundColor: Theme.of(context).colorScheme.surface,
                heroTag: 'Languages',
                elevation: 1,
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.surface,
                ),
                label: Text(
                  'Add Language',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              );
  }
}