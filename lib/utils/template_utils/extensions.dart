import 'package:craft_ai/models/education.dart';
import 'package:craft_ai/models/language.dart';
import 'package:craft_ai/models/link.dart';
import 'package:craft_ai/models/skill.dart';
import 'package:craft_ai/models/tool.dart';
import 'package:craft_ai/models/user_data.dart';
import 'package:craft_ai/models/work_experience.dart';
import 'package:craft_ai/views/language_detail_edit_screen/widgets/language_detail_fluency_field.dart';
import 'package:craft_ai/views/links_detail_edit_screen/widgets/link_detail_fluency_field.dart';
import 'package:intl/intl.dart';

extension UserDataExt on UserData {
  Map<String, dynamic> toHtmlUsableFormat() {
    return <String, dynamic>{
      UserData.nameKey: name,
      UserData.designationKey: designation,
      UserData.emailKey: email,
      UserData.summaryKey: summary,
      UserData.phoneNoKey: phoneNo,
      UserData.addressKey: address,
      UserData.profileImageKey: profileImage,
      UserData.skillsKey: skills.map((x) => x.toHtmlUsableFormat()).toList(),
      UserData.toolsKey: tools.map((x) => x.toHtmlUsableFormat()).toList(),
      UserData.workExperienceKey:
          workExperience.map((x) => x.toHtmlUsableFormat()).toList(),
      UserData.educationKey:
          education.map((x) => x.toHtmlUsableFormat()).toList(),
      UserData.languageKey: languages.map((x) => x.toHtmlUsableFormat()).toList(),
      UserData.linksKey: links.map((x) => x.toHtmlUsableFormat()).toList(),
    };
  }
}

extension WorkExperienceExt on WorkExperience {
  Map<String, String> toHtmlUsableFormat() {
    return <String, String>{
      WorkExperience.jobRoleKey: jobRole,
      WorkExperience.jobDescriptionKey: jobDescription,
      WorkExperience.companyNameKey: companyName,
      WorkExperience.companyAddressKey: companyAddress,
      WorkExperience.startDateKey: DateFormat('MMMM, yyyy').format(startDate),
      WorkExperience.endDateKey: DateFormat('MMMM, yyyy').format(endDate),
    };
  }
}

extension EducationExt on Education {
  Map<String, String> toHtmlUsableFormat() {
    return <String, String>{
      Education.degreeNameKey: degreeName,
      Education.instituteNameKey: instituteName,
      Education.instituteAddressKey: instituteAddress,
      Education.startDateKey: DateFormat('MMMM, yyyy').format(startDate),
      Education.endDateKey: DateFormat('MMMM, yyyy').format(endDate),
    };
  }
}

extension LanguageExt on Language {
  Map<String, String> toHtmlUsableFormat() {
    return <String, String>{Language.nameKey: name, Language.proficiencyKey: getFluencyFromIndex(fluency)};
  }
}

extension LinkExt on Link{
  Map<String, String> toHtmlUsableFormat() {
    return <String, String>{
      Link.urlKey : url,
      Link.nameKey : getLinkNameFromIndex(name),
    };
  }
}

extension SkillExt on Skill{
  Map<String, String> toHtmlUsableFormat() {
    return <String, String>{
      Skill.nameKey : name,
    };
  }
}

extension ToolExt on Tool{
    Map<String, String> toHtmlUsableFormat() {
    return <String, String>{
      Tool.nameKey : name,
    };
  }
}