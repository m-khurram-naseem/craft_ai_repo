
import 'package:flutter/material.dart';

class ToolsDetailAddBtn extends StatelessWidget {
  final void Function() onPressed;
  const ToolsDetailAddBtn({super.key , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: FloatingActionButton.extended(
          onPressed: onPressed,
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          foregroundColor: Theme.of(context).colorScheme.surface,
          elevation: 1,
          icon: Icon(Icons.add),
          label: Text(
            'Add Tool',
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
