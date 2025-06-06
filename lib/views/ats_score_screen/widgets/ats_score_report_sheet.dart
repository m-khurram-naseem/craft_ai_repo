import 'package:flutter/material.dart';
import 'package:craft_ai/views/ats_score_screen/widgets/ats_score_divider.dart';
import 'package:craft_ai/views/ats_score_screen/widgets/ats_score_insights_list.dart';
import 'package:craft_ai/views/ats_score_screen/widgets/ats_score_texts.dart';
import 'package:craft_ai/views/ats_score_screen/widgets/ats_score_recommendations_list.dart';
import 'package:craft_ai/views/ats_score_screen/widgets/ats_score_resume_score.dart';

class AtsScoreReportSheet extends StatelessWidget {
  final ScrollController controller;
  const AtsScoreReportSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: CustomScrollView(
          controller: controller,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              title: Text(
                'Report',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.close),
                  ),
                ),
              actions: [
                GestureDetector(
                  onTap: () {
                  
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.share),
                  ),
                ),
              ],
            ),
            AtsScoreResumeScoreText(),
            AtsScoreResumeScore(),
            AtsScoreDivider(),
            // Insights Portion
            AtsScoreInsightsText(),
            AtsScoreInsightsList(),
            AtsScoreDivider(),
            // Recommendations Portion
            AtsScoreRecommendationsText(),
            AtsScoreRecommendationsList(),
            AtsScoreDivider(),
            AtsScoreRecommendationsList(),
          ],
        ),
      ),
    );
  }
}
