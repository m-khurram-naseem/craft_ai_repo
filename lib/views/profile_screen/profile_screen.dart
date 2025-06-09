import 'package:craft_ai/controllers/profile_state_notifier/profile_providers.dart';
import 'package:craft_ai/models/user_data.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_education_tiles.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_image.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_languages_tiles.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_name.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_personal_information_tiles.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_skills_grid.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_social_links_tile.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_texts.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_tools_grid.dart';
import 'package:craft_ai/views/profile_screen/widgets/profile_screen_work_experience_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncValue = ref.watch(profileStreamProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: asyncValue.when(
          data: (data) {
            return ProfileScreenLoadedBody(userData: data);
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
          loading: () {
            return LoadingAnimationWidget.threeRotatingDots(
              color: Theme.of(context).colorScheme.primary,
              size: 25,
            );
          },
          skipLoadingOnRefresh: true,
          skipLoadingOnReload: true,
        ),
      ),
    );
  }
}

class ProfileScreenLoadedBody extends StatelessWidget {
  final UserData userData;
  const ProfileScreenLoadedBody({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Image
        ProfileScreenImage(),
        // Name
        ProfileScreenName(name: userData.name),
        // Personal Information Block
        ProfileScreenPersonalInfoText(
          userData: userData,
          isEdit:
              userData.designation.isNotEmpty &&
              userData.email.isNotEmpty &&
              userData.phoneNo.isNotEmpty &&
              userData.address.isNotEmpty,
        ),
        ProfileScreenPersonalInformationDesignationTile(
          designation: userData.designation,
        ),
        ProfileScreenPersonalInformationEmailTile(email: userData.email),
        ProfileScreenPersonalInformationPhoneNoTile(phoneNo: userData.phoneNo),
        ProfileScreenPersonalInformationAddressTile(address: userData.address),

        // Work Experience Block
        ProfileScreenWorkExperienceText(
          workExperiences: userData.workExperience,
        ),
        for (var i = 0; i < userData.workExperience.length; i++)
          ProfileScreenWorkExperienceTile(
            experience: userData.workExperience[i],
            isTopRounded: i == 0,
            isBottomRounded: i == userData.workExperience.length - 1,
          ),

        // Education Block
        ProfileScreenEducationText(education: userData.education),
        for (var i = 0; i < userData.education.length; i++)
          ProfileScreenEducationTile(
            education: userData.education[i],
            isTopRounded: i == 0,
            isBottomRounded: i == userData.education.length - 1,
          ),

        // Skills Block
        ProfileScreenSkillsText(skills: userData.skills),
        ProfileScreenSkillsGrid(skills: userData.skills),

        // Tools Block
        ProfileScreenToolsText(tools: userData.tools),
        ProfileScreenToolsGrid(tools: userData.tools),

        // Languages Block
        ProfileScreenLanguagesText(isEdit: userData.languages.isNotEmpty),
        for (var i = 0; i < userData.languages.length; i++)
          ProfileScreenLanguagesTile(
            language: userData.languages[i].name,
            fluency: userData.languages[i].proficiency,
            isTopRounded: i == 0,
            isBottomRounded: i == userData.languages.length - 1,
          ),

        // Links Block
        ProfileScreenLinksText(isEdit: userData.links.isNotEmpty),
        for (var i = 0; i < userData.links.length; i++)
          ProfileScreenSocialLinksTile(
            title: userData.links[i].name,
            link: userData.links[i].url,
            isTopRounded: i == 0,
            isBottomRounded: i == userData.links.length - 1,
          ),
      ],
    );
  }
}
