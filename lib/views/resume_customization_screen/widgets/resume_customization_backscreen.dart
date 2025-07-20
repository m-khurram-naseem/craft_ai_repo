import 'package:craft_ai/models/user_data.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_education_tile.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_experience_tile.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_language_tile.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_link_tile.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_skill_grid.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_text_widgets.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_tiles.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_tools_grid.dart';
import 'package:flutter/material.dart';

class ResumeCustomizationBackscreen extends StatefulWidget {
  final UserData userData;
  final void Function(UserData userData) update;
  const ResumeCustomizationBackscreen({
    super.key,
    required this.userData,
    required this.update,
  });

  @override
  State<ResumeCustomizationBackscreen> createState() =>
      _ResumeCustomizationBackscreenState();
}

class _ResumeCustomizationBackscreenState
    extends State<ResumeCustomizationBackscreen> {
  late UserData editedData;
  @override
  void initState() {
    super.initState();
    editedData = widget.userData.copyWith();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // Personal Information Block
        ResumeCustomizationProfileText(),
        ResumeCustomizationNameTile(name: widget.userData.name),
        ResumeCustomizationDesignationTile(
          designation: widget.userData.designation,
        ),
        ResumeCustomizationEmailTile(email: widget.userData.email),
        ResumeCustomizationPhoneNoTile(phoneNo: widget.userData.phoneNo),
        ResumeCustomizationAddressTile(address: widget.userData.address),

        // Work Experience Block
        ResumeCustomizationWorkExperienceText(),
        for (var i = 0; i < widget.userData.workExperience.length; i++)
          ResumeCustomizationExperienceTile(
            experience: widget.userData.workExperience[i],
            isTopRounded: i == 0,
            isBottomRounded: i == widget.userData.workExperience.length - 1,
            isExist: editedData.workExperience.contains(
              widget.userData.workExperience[i],
            ),
            onAddTap: (experience) {
              setState(() {
                editedData.workExperience.add(experience);
                widget.update(editedData);
              });
            },
            onDeleteTap: (experience) {
              setState(() {
                editedData.workExperience.remove(experience);
                widget.update(editedData);
              });
            },
          ),

        // Education Block
        ResumeCustomizationEducationText(),
        for (var i = 0; i < widget.userData.education.length; i++)
          ResumeCustomizationEducationTile(
            education: widget.userData.education[i],
            isTopRounded: i == 0,
            isBottomRounded: i == widget.userData.education.length - 1,
            isExist: editedData.education.contains(
              widget.userData.education[i],
            ),
            onAddTap: (education) {
              setState(() {
                editedData.education.add(education);
                widget.update(editedData);
              });
            },
            onDeleteTap: (education) {
              setState(() {
                editedData.education.remove(education);
                widget.update(editedData);
              });
            },
          ),

        // Skills Block
        ResumeCustomizationSkillsText(),
        for (var i = 0; i < widget.userData.skills.length; i++)
          ResumeCustomizationSkillsTile(
            skill: widget.userData.skills[i],
            isTopRounded: i == 0,
            isBottomRounded: i == widget.userData.skills.length - 1,
            isExist: editedData.skills.contains(widget.userData.skills[i]),
            onAddTap: (skill) {
              setState(() {
                editedData.skills.add(skill);
                widget.update(editedData);
              });
            },
            onDeleteTap: (skill) {
              setState(() {
                editedData.skills.remove(skill);
                widget.update(editedData);
              });
            },
          ),

        // Tools Block
        ResumeCustomizationToolsText(),
        for (var i = 0; i < widget.userData.tools.length; i++)
          ResumeCustomizationToolsTile(
            tool: widget.userData.tools[i],
            isTopRounded: i == 0,
            isBottomRounded: i == widget.userData.tools.length - 1,
            isExist: editedData.skills.contains(widget.userData.skills[i]),
            onAddTap: (tool) {
              setState(() {
                editedData.tools.add(tool);
                widget.update(editedData);
              });
            },
            onDeleteTap: (tool) {
              setState(() {
                editedData.tools.remove(tool);
                widget.update(editedData);
              });
            },
          ),

        // Languages Block
        ResumeCustomizationLanguagesText(),
        for (var i = 0; i < widget.userData.languages.length; i++)
          ResumeCustomizationLanguageTile(
            language: widget.userData.languages[i],
            fluency: widget.userData.languages[i].fluency,
            isTopRounded: i == 0,
            isBottomRounded: i == widget.userData.languages.length - 1,
            isExist: editedData.languages.contains(
              widget.userData.languages[i],
            ),
            onAddTap: (language) {
              setState(() {
                editedData.languages.add(language);
                widget.update(editedData);
              });
            },
            onDeleteTap: (language) {
              setState(() {
                editedData.languages.remove(language);
                widget.update(editedData);
              });
            },
          ),

        // Links Block
        ResumeCustomizationSocialLinkText(),
        for (var i = 0; i < widget.userData.links.length; i++)
          ResumeCustomizationLinkTile(
            link: widget.userData.links[i],            
            isTopRounded: i == 0,
            isBottomRounded: i == widget.userData.links.length - 1,
            isExist: editedData.links.contains(
              widget.userData.links[i],
            ),
            onAddTap: (link) {
              setState(() {
                editedData.links.add(link);
                widget.update(editedData);
              });
            },
            onDeleteTap: (link) {
              setState(() {
                editedData.links.remove(link);
                widget.update(editedData);
              });
            },
          ),
        SliverToBoxAdapter(child: SizedBox(height: 50)),
      ],
    );
  }
}
