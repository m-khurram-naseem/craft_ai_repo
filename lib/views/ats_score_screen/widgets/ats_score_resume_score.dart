import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AtsScoreResumeScore extends StatelessWidget {
  const AtsScoreResumeScore({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CircularPercentIndicator(
        radius: 60.0,
        lineWidth: 14.0,
        percent: 0.74,
        animation: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        linearGradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.onSecondary,
            Theme.of(context).colorScheme.primary.withAlpha(150),
          ],
        ),
        circularStrokeCap: CircularStrokeCap.round,
        center: Text(
          "74%",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontFamily: 'Urbanist',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
