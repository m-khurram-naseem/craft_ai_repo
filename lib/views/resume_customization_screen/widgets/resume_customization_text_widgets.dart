import 'package:flutter/material.dart';

class ResumeCustomizationProfileText extends StatelessWidget {
  const ResumeCustomizationProfileText({super.key});

  @override
  Widget build(BuildContext context) {
    return ResumeCustomizationBaseTextWidget(
      text: 'Personal Information',
      onEditTap: () {},
    );
  }
}

class ResumeCustomizationWorkExperienceText extends StatelessWidget {
  const ResumeCustomizationWorkExperienceText({super.key});

  @override
  Widget build(BuildContext context) {
    return ResumeCustomizationBaseTextWidget(
      text: 'Work Experience',
      onEditTap: () {},
    );
  }
}

class ResumeCustomizationEducationText extends StatelessWidget {
  const ResumeCustomizationEducationText({super.key});

  @override
  Widget build(BuildContext context) {
    return ResumeCustomizationBaseTextWidget(
      text: 'Education',
      onEditTap: () {},
    );
  }
}

class ResumeCustomizationSkillsText extends StatelessWidget {
  const ResumeCustomizationSkillsText({super.key});

  @override
  Widget build(BuildContext context) {
    return ResumeCustomizationBaseTextWidget(text: 'Skills', onEditTap: () {});
  }
}

class ResumeCustomizationToolsText extends StatelessWidget {
  const ResumeCustomizationToolsText({super.key});

  @override
  Widget build(BuildContext context) {
    return ResumeCustomizationBaseTextWidget(text: 'Tools', onEditTap: () {});
  }
}

class ResumeCustomizationLanguagesText extends StatelessWidget {
  const ResumeCustomizationLanguagesText({super.key});

  @override
  Widget build(BuildContext context) {
    return ResumeCustomizationBaseTextWidget(
      text: 'Languages',
      onEditTap: () {},
    );
  }
}

class ResumeCustomizationSocialLinkText extends StatelessWidget {
  const ResumeCustomizationSocialLinkText({super.key});

  @override
  Widget build(BuildContext context) {
    return ResumeCustomizationBaseTextWidget(
      text: 'Social Links',
      onEditTap: () {},
    );
  }
}

class ResumeCustomizationBaseTextWidget extends StatelessWidget {
  final String text;
  final GestureTapCallback onEditTap;
  const ResumeCustomizationBaseTextWidget({
    super.key,
    required this.text,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Urbanist',
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),            
            Opacity(
              opacity: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.edit_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
