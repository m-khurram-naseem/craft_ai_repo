import 'dart:async';

import 'package:craft_ai/views/ats_score_screen/widgets/ats_floating_btns.dart';
import 'package:craft_ai/views/ats_score_screen/widgets/ats_score_job_description_field.dart';
import 'package:craft_ai/views/ats_score_screen/widgets/ats_score_report_sheet.dart';
import 'package:craft_ai/views/ats_score_screen/widgets/ats_score_texts.dart';
import 'package:craft_ai/views/ats_score_screen/widgets/ats_score_upload_resume_btn.dart';
import 'package:flutter/material.dart';

class AtsScoreScreen extends StatefulWidget {
  const AtsScoreScreen({super.key});

  @override
  State<AtsScoreScreen> createState() => _AtsScoreScreenState();
}

class _AtsScoreScreenState extends State<AtsScoreScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: CustomScrollView(
          slivers: [
            // Job Description Portion
            AtsScoreJobDescriptionText(),
            AtsScoreJobDescriptionField(),
            AtsScoreUploadResumeBtn(),
          ],
        ),
      ),
      floatingActionButton: AtsFloatingBtns(
        aiScoreOnTap: () {
          setState(() {
            isLoading = true;
            Timer(Duration(seconds: 3), () {
              setState(() {
                isLoading = false;
                showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              useSafeArea: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return DraggableScrollableSheet(
                  expand: true,
                  initialChildSize: 1,
                  minChildSize: 1,
                  maxChildSize: 1,
                  builder: (context, scrollController) {
                    return AtsScoreReportSheet(controller: scrollController);
                  },
                );
              },
            );
              });
            },);
          });
        },
        apiScoreOnTap: () {},
        isLoading: isLoading,
      ),
    );
  }
}
