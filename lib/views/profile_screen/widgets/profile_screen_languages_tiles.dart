import 'package:craft_ai/views/profile_screen/widgets/profile_screen_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreenLanguagesTile extends StatelessWidget {
  final String language;
  final int fluency;
  final bool isTopRounded;
  final bool isBottomRounded;
  const ProfileScreenLanguagesTile({
    super.key,
    required this.language,
    required this.fluency,
    this.isTopRounded = false,
    this.isBottomRounded = false,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileScreenTile(
      title: language,
      trailing: Text(
        getFluencyFromIndex(fluency),
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary.withAlpha(150),
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
        ),
      ),
      isBottomRounded: isBottomRounded,
      isTopRounded: isTopRounded,
      onTap: () {},
    );
  }
}


String getFluencyFromIndex(int i){
  return switch(i){
    0 => 'Beginner' , 
    1 => 'Proficient',
    2 => 'Fluent',
    3 => 'Native',
    _ => '',
  };
}