import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_ai/models/education.dart';
import 'package:craft_ai/models/language.dart';
import 'package:craft_ai/models/link.dart';
import 'package:craft_ai/models/user_data.dart';
import 'package:craft_ai/models/work_experience.dart';
import 'package:craft_ai/services/data_sources/profile_data_source.dart';

class ProfileDataSourceImpl extends ProfileDataSource {
  static const userId = 'khurram24';
  var firestore = FirebaseFirestore.instance.collection('Users');
  // SharedPreferences sharedPreferences;
  ProfileDataSourceImpl();

  @override
  Future<void> addUser(UserData userData) {
    return firestore.doc(userId).set(userData.toMap(), SetOptions(merge: true));
  }

  @override
  Future<void> addWorkExperience(List<WorkExperience> workExperience) {
    return firestore.doc(userId).set({
      UserData.workExperienceKey: workExperience.map((e) => e.toMap()).toList(),
    }, SetOptions(merge: true));
  }

  @override
  Future<void> addEducation(List<Education> education) {
    return firestore.doc(userId).set({
      UserData.educationKey: education.map((e) => e.toMap()).toList(),
    }, SetOptions(merge: true));
  }

  @override
  Future<void> addLanguages(List<Language> languages) {
    return firestore.doc(userId).set({
      UserData.languageKey: languages.map((e) => e.toMap()).toList(),
    }, SetOptions(merge: true));
  }

  @override
  Future<void> addLinks(List<Link> links) {
    return firestore.doc(userId).set({
      UserData.linksKey: links.map((e) => e.toMap()).toList(),
    }, SetOptions(merge: true));
  }

  @override
  Future<void> addSkills(List<String> skills) {
    return firestore.doc(userId).set({
      UserData.skillsKey: skills,
    }, SetOptions(merge: true));
  }

  @override
  Future<void> addTools(List<String> tools) {
    return firestore.doc(userId).set({
      UserData.toolsKey: tools,
    }, SetOptions(merge: true));
  }
  
  @override
  Stream<UserData> fetchUserData(){
    var docSnapshotStream = firestore.doc(userId).snapshots();
    return docSnapshotStream.map((event) => UserData.fromMap(event.data() ?? {}),);
    }   
}
