
import 'package:craft_ai/controllers/profile_state_notifier/profile_state_notifier.dart';
import 'package:craft_ai/controllers/profile_state_notifier/profile_states.dart';
import 'package:craft_ai/models/user_data.dart';
import 'package:craft_ai/services/data_sources/profile_data_source.dart';
import 'package:craft_ai/services/data_sources/profile_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = FutureProvider((ref) => SharedPreferences.getInstance(),);

final profileDataSourceProvider = Provider<ProfileDataSource>((ref){  
  // var sharedPreferenceAsync = ref.read(sharedPreferencesProvider);  
  return ProfileDataSourceImpl();
});

final profileStateNotifierProvider = StateNotifierProvider<ProfileScreenStateNotifier,ProfileState>((ref) => ProfileScreenStateNotifier(profileDataSource: ref.read(profileDataSourceProvider)),);


final profileStreamProvider = StreamProvider.autoDispose<UserData>((ref){
  return ref.read(profileDataSourceProvider).fetchUserData();
});