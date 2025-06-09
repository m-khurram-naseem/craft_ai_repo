
import 'package:craft_ai/controllers/profile_state_notifier/profile_states.dart';
import 'package:craft_ai/models/education.dart';
import 'package:craft_ai/models/language.dart';
import 'package:craft_ai/models/link.dart';
import 'package:craft_ai/models/user_data.dart';
import 'package:craft_ai/models/work_experience.dart';
import 'package:craft_ai/services/data_sources/profile_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreenStateNotifier extends StateNotifier<ProfileState>{
  final ProfileDataSource profileDataSource;
   ProfileScreenStateNotifier({required this.profileDataSource}):super(ProfileInitialState());

  addUserData(UserData userData) async{
    try{
      state = ProfileLoadingState();
    await profileDataSource.addUser(userData);    
      state = ProfileLoadedState();    
    }catch(e){
      state = ProfileErrorState(message: 'Unexpected Error');
    }
  }

  addWorkExperience(List<WorkExperience> workExperience) async{
    try{
      state = ProfileLoadingState();
    await profileDataSource.addWorkExperience(workExperience);    
      state = ProfileLoadedState();    
    }catch(e){
      state = ProfileErrorState(message: 'Unexpected Error');
    }
  }

  addEducation(List<Education> education) async{
    try{
      state = ProfileLoadingState();
    await profileDataSource.addEducation(education);    
      state = ProfileLoadedState();    
    }catch(e){
      state = ProfileErrorState(message: 'Unexpected Error');
    }
  }

  addSkills(List<String> skills) async{
    try{
      state = ProfileLoadingState();
    await profileDataSource.addSkills(skills);    
      state = ProfileLoadedState();    
    }catch(e){
      state = ProfileErrorState(message: 'Unexpected Error');
    }
  }

  addTools(List<String> tools) async{
    try{
      state = ProfileLoadingState();
    await profileDataSource.addTools(tools);    
      state = ProfileLoadedState();    
    }catch(e){
      state = ProfileErrorState(message: 'Unexpected Error');
    }
  }

  addLanguages(List<Language> languages) async{
    try{
      state = ProfileLoadingState();
    await profileDataSource.addLanguages(languages);    
      state = ProfileLoadedState();    
    }catch(e){
      state = ProfileErrorState(message: 'Unexpected Error');
    }
  }

  addLinks(List<Link> links) async{
    try{
      state = ProfileLoadingState();
    await profileDataSource.addLinks(links);    
      state = ProfileLoadedState();    
    }catch(e){
      state = ProfileErrorState(message: 'Unexpected Error');
    }
  }

}
