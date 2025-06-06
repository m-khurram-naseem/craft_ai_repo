import 'package:craft_ai/views/profile_screen/widgets/profile_screen_image.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_texts.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: CustomScrollView(
          slivers: [
            ProfileScreenImage(),
            // SliverPadding(
            //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            //   sliver: SliverToBoxAdapter(
            //     child: Text(
            //       'M. Khuram Naseem',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontFamily: 'Urbanist',
            //         color: Theme.of(context).colorScheme.primary,
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // ),
            // Personal Information Block
            ProfileScreenPersonalInfoText(isEdit: false),
            // ProfileScreenPersonalInformationDesignationTile(),
            // ProfileScreenPersonalInformationEmailTile(),
            // ProfileScreenPersonalInformationPhoneNoTile(),
            // ProfileScreenPersonalInformationAddressTile(),

            // Work Experience Block
            ProfileScreenWorkExperienceText(isEdit: false),
            // for (var i = 0; i < 4; i++)
            //   ProfileScreenWorkExperienceTile(
            //     isTopRounded: i == 0,
            //     isBottomRounded: i == 3,
            //   ),

            // Education Block
            ProfileScreenEducationText(isEdit: false),
            // for (var i = 0; i < 4; i++)
            //   ProfileScreenEducationTile(
            //     isTopRounded: i == 0,
            //     isBottomRounded: i == 3,
            //   ),

            // Skills Block
            ProfileScreenSkillsText(isEdit: false),
            // ProfileScreenSkillsGrid(),

            // Tools Block
            ProfileScreenToolsText(isEdit: false),
            // ProfileScreenToolsGrid(),

            // Languages Block
            ProfileScreenLanguagesText(isEdit: false),
            // for (var i = 0; i < languages.keys.length; i++)
            //   ProfileScreenLanguagesTile(
            //     language: languages.keys.toList()[i],
            //     fluency: languages.values.toList()[i],
            //     isTopRounded: i == 0,
            //     isBottomRounded: i == languages.length - 1,
            //   ),

            // Links Block
            ProfileScreenLinksText(isEdit: false),
            // for (var i = 0; i < languages.keys.length; i++)
            //   ProfileScreenSocialLinksTile(
            //     title: 'Linked In',
            //     link: 'https://www.linkedin.com/in/m-khuram-naseem',
            //     isTopRounded: i == 0,
            //     isBottomRounded: i == languages.length - 1,
            //   ),
          ],
        ),
      ),
    );
  }
}

var languages = {'English': 'Fluent', 'Urdu': 'Native', 'German': 'Beginner'};
