import 'package:craft_ai/models/education.dart';
import 'package:craft_ai/models/language.dart';
import 'package:craft_ai/models/link.dart';
import 'package:craft_ai/models/user_data.dart';
import 'package:craft_ai/models/work_experience.dart';

abstract class ProfileDataSource {
  Future<void> addUser(UserData userData);
  Future<void> addWorkExperience(List<WorkExperience> workExperience);
  Future<void> addEducation(List<Education> education);
  Future<void> addSkills(List<String> skills);
  Future<void> addTools(List<String> tools);
  Future<void> addLanguages(List<Language> languages);
  Future<void> addLinks(List<Link> links);
  Stream<UserData> fetchUserData();
}