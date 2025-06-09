import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:craft_ai/models/education.dart';
import 'package:craft_ai/models/language.dart';
import 'package:craft_ai/models/link.dart';
import 'package:craft_ai/models/work_experience.dart';

class UserData {
  static const nameKey = 'userName',
      designationKey = 'designation',
      emailKey = 'email',
      phoneNoKey = 'phoneNo',
      addressKey = 'address',
      profileImageKey = 'profileImage',
      skillsKey = 'skills',
      toolsKey = 'tools',
      workExperienceKey = 'workExperience',
      educationKey = 'education',
      languageKey = 'languages',
      linksKey = 'links';
  String name;
  String designation;
  String email;
  String phoneNo;
  String address;
  String profileImage;
  List<String> skills;
  List<String> tools;
  List<WorkExperience> workExperience;
  List<Education> education;
  List<Language> languages;
  List<Link> links;
  UserData({
    required this.name,
    required this.designation,
    required this.email,
    required this.phoneNo,
    required this.address,
    required this.profileImage,
    required this.skills,
    required this.tools,
    required this.workExperience,
    required this.education,
    required this.languages,
    required this.links,
  });

  UserData copyWith({
    String? name,
    String? designation,
    String? email,
    String? phoneNo,
    String? address,
    String? profileImage,
    List<String>? skills,
    List<String>? tools,
    List<WorkExperience>? workExperience,
    List<Education>? education,
    List<Language>? languages,
    List<Link>? links,
  }) {
    return UserData(
      name: name ?? this.name,
      designation: designation ?? this.designation,
      email: email ?? this.email,
      phoneNo: phoneNo ?? this.phoneNo,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
      skills: skills ?? this.skills,
      tools: tools ?? this.tools,
      workExperience: workExperience ?? this.workExperience,
      education: education ?? this.education,
      languages: languages ?? this.languages,
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      nameKey: name,
      designationKey: designation,
      emailKey: email,
      phoneNoKey: phoneNo,
      addressKey: address,
      profileImageKey: profileImage,
      skillsKey: skills,
      toolsKey: tools,
      workExperienceKey: workExperience.map((x) => x.toMap()).toList(),
      educationKey: education.map((x) => x.toMap()).toList(),
      languageKey: languages.map((x) => x.toMap()).toList(),
      linksKey: links.map((x) => x.toMap()).toList(),
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: (map[nameKey] ?? '') as String,
      designation: (map[designationKey] ?? '') as String,
      email: (map[emailKey] ?? '') as String,
      phoneNo: (map[phoneNoKey] ?? '') as String,
      address: (map[addressKey] ?? '') as String,
      profileImage: (map[profileImageKey] ?? '') as String,
      skills: List<String>.from(((map[skillsKey] ?? []) as List<dynamic>)),
      tools: List<String>.from(((map[toolsKey] ?? []) as List<dynamic>)),
      workExperience:
          ((map[workExperienceKey] ?? []) as List)
              .map((e) => WorkExperience.fromMap(e))
              .toList(),
      education:
          ((map[educationKey] ?? []) as List)
              .map((e) => Education.fromMap(e))
              .toList(),
      languages:
          ((map[languageKey] ?? []) as List)
              .map((e) => Language.fromMap(e))
              .toList(),
      links:
          ((map[linksKey] ?? []) as List).map((e) => Link.fromMap(e)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(name: $name, designation: $designation, email: $email, phoneNo: $phoneNo, address: $address, profileImage: $profileImage, skills: $skills, tools: $tools, workExperience: $workExperience, education: $education, languages: $languages, links: $links)';
  }

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.designation == designation &&
        other.email == email &&
        other.phoneNo == phoneNo &&
        other.address == address &&
        other.profileImage == profileImage &&
        listEquals(other.skills, skills) &&
        listEquals(other.tools, tools) &&
        listEquals(other.workExperience, workExperience) &&
        listEquals(other.education, education) &&
        listEquals(other.languages, languages) &&
        listEquals(other.links, links);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        designation.hashCode ^
        email.hashCode ^
        phoneNo.hashCode ^
        address.hashCode ^
        profileImage.hashCode ^
        skills.hashCode ^
        tools.hashCode ^
        workExperience.hashCode ^
        education.hashCode ^
        languages.hashCode ^
        links.hashCode;
  }
}
