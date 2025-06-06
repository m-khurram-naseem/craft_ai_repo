import 'package:craft_ai/views/work_experience_edit_screen/work_expreicne_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkExperienceAddBtn extends StatelessWidget {
  const WorkExperienceAddBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => WorkExpreicneEditScreen(isUpdate: false),
              ),
            );
          },
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          foregroundColor: Theme.of(context).colorScheme.surface,
          elevation: 1,
          icon: Icon(Icons.add),
          label: Text(
            'Add Experience',
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
