import 'package:craft_ai/views/education_detail_screen/education_detail_screen.dart';
import 'package:craft_ai/views/language_detail_screen/language_detail_screen.dart';
import 'package:craft_ai/views/links_detail_screen/links_detail_screen.dart';
import 'package:craft_ai/views/personal_info_edit_screen/personal_info_edit_screen.dart';
import 'package:craft_ai/views/profile_screen/profile_screen.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_skills_grid.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_tools_grid.dart';
import 'package:craft_ai/views/skills_detail_screen/skills_detail_screen.dart';
import 'package:craft_ai/views/tools_detail_screen/tools_detail_screen.dart';
import 'package:craft_ai/views/work_experience_detail_screen/work_experience_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreenText extends StatelessWidget {
  final String text;
  final void Function() onEditTap;
  final bool isEdit;
  const ProfileScreenText({
    super.key,
    required this.text,
    required this.onEditTap,
    required this.isEdit,
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
            GestureDetector(
              onTap: onEditTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  isEdit ? Icons.edit_outlined : Icons.add,
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

class ProfileScreenPersonalInfoText extends StatelessWidget {
  static const title = 'Personal Information';
  final bool isEdit;
  const ProfileScreenPersonalInfoText({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return ProfileScreenText(
      text: title,
      isEdit: isEdit,
      onEditTap:
          () => Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => PersonalInfoEditScreen(title: title),
            ),
          ),
    );
  }
}

class ProfileScreenWorkExperienceText extends StatelessWidget {
  static const title = 'Work Experience';
  final bool isEdit;
  const ProfileScreenWorkExperienceText({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return ProfileScreenText(
      text: title,
      isEdit: isEdit,
      onEditTap:
          () => Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => WorkExperienceDetailScreen(title: title),
            ),
          ),
    );
  }
}

class ProfileScreenEducationText extends StatelessWidget {
  static const title = 'Education';
  final bool isEdit;
  const ProfileScreenEducationText({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return ProfileScreenText(
      text: title,
      isEdit: isEdit,
      onEditTap:
          () => Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => EducationDetailScreen(title: title),
            ),
          ),
    );
  }
}

class ProfileScreenSkillsText extends StatelessWidget {
  static const title = 'Skills';
  final bool isEdit;
  const ProfileScreenSkillsText({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return ProfileScreenText(
      text: title,
      isEdit: isEdit,
      onEditTap:
          () => Navigator.of(context).push(
            CupertinoPageRoute(
              builder:
                  (context) => SkillsDetailScreen(title: title, skills: skills),
            ),
          ),
    );
  }
}

class ProfileScreenLanguagesText extends StatelessWidget {
  static const title = 'Languages';
  final bool isEdit;
  const ProfileScreenLanguagesText({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return ProfileScreenText(
      text: title,
      isEdit: isEdit,
      onEditTap:
          () => Navigator.of(context).push(
            CupertinoPageRoute(
              builder:
                  (context) =>
                      LanguageDetailScreen(title: title, languages: languages),
            ),
          ),
    );
  }
}

class ProfileScreenLinksText extends StatelessWidget {
  static const title = 'Social Links';
  final bool isEdit;
  const ProfileScreenLinksText({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return ProfileScreenText(
      text: title,
      isEdit: isEdit,
      onEditTap:
          () => Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => LinksDetailScreen(title: title),
            ),
          ),
    );
  }
}

class ProfileScreenToolsText extends StatelessWidget {
  static const title = 'Tools';
  final bool isEdit;
  const ProfileScreenToolsText({super.key, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return ProfileScreenText(
      text: title,
      isEdit: isEdit,
      onEditTap:
          () => Navigator.of(context).push(
            CupertinoPageRoute(
              builder:
                  (context) => ToolsDetailScreen(title: title, tools: tools),
            ),
          ),
    );
  }
}
