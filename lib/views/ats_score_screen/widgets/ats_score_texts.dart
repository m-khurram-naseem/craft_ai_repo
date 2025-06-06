import 'package:flutter/material.dart';

class AtsScoreText extends StatelessWidget {
  final String text;
  const AtsScoreText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      sliver: SliverToBoxAdapter(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Urbanist',
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class AtsScoreJobDescriptionText extends StatelessWidget {
  const AtsScoreJobDescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return AtsScoreText(text: 'Job Description');
  }
}

class AtsScoreResumeScoreText extends StatelessWidget {
  const AtsScoreResumeScoreText({super.key});

  @override
  Widget build(BuildContext context) {
    return AtsScoreText(text: 'Resume Score');
  }
}

class AtsScoreInsightsText extends StatelessWidget {
  const AtsScoreInsightsText({super.key});

  @override
  Widget build(BuildContext context) {
    return AtsScoreText(text: 'Insights');
  }
}

class AtsScoreRecommendationsText extends StatelessWidget {
  const AtsScoreRecommendationsText({super.key});

  @override
  Widget build(BuildContext context) {
    return AtsScoreText(text: 'Recommendations');
  }
}
