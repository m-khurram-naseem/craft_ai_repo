import 'package:flutter/material.dart';

class LinksDetailFloatingBtn extends StatelessWidget {
  final VoidCallback onPressed;
  const LinksDetailFloatingBtn({super.key , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
                onPressed: onPressed,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                foregroundColor: Theme.of(context).colorScheme.surface,
                heroTag: 'SocailLinks',
                elevation: 1,
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.surface,
                ),
                label: Text(
                  'Add Link',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              );
  }
}