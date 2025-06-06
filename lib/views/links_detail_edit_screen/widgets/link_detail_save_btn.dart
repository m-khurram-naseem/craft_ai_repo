import 'package:flutter/material.dart';

class LinkDetailSaveBtn extends StatelessWidget {
  const LinkDetailSaveBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          foregroundColor: Theme.of(context).colorScheme.surface,
          elevation: 1,
          icon: Image.asset(
            'assets/icons/save.png',
            width: 23,
            color: Theme.of(context).colorScheme.primary,
          ),
          label: Text(
            'Save Link',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
      ),
    );
  }
}
