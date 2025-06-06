import 'package:flutter/material.dart';

class AtsScoreUploadResumeBtn extends StatelessWidget {
  const AtsScoreUploadResumeBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10, left: 12, right: 12),
      sliver: SliverToBoxAdapter(
        child: FloatingActionButton.extended(
          onPressed: () {
            
          },
          heroTag: 2,
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          foregroundColor: Theme.of(context).colorScheme.surface,
          elevation: 1,
          icon: Icon(
            Icons.upload_outlined,
            color: Theme.of(context).colorScheme.surface,
          ),
          label: Text(
            'Upload Resume',
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



// Select Resume Button (if needed)
// FloatingActionButton.extended(
//                       onPressed: () {},
//                       heroTag: 1,
//                       backgroundColor:
//                           Theme.of(context).colorScheme.onSecondary,
//                       foregroundColor: Theme.of(context).colorScheme.surface,
//                       elevation: 1,
//                       icon: Icon(
//                         Icons.workspaces_outlined,
//                         color: Theme.of(context).colorScheme.surface,
//                       ),
//                       label: Text(
//                         'Select Resume',
//                         style: TextStyle(
//                           fontFamily: 'Urbanist',
//                           fontWeight: FontWeight.w700,
//                           color: Theme.of(context).colorScheme.surface,
//                         ),
//                       ),
//                     ),