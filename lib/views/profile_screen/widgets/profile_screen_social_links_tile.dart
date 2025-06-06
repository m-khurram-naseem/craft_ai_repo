import 'package:craft_ai/views/profile_screen/widgets/profile_screen_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreenSocialLinksTile extends StatelessWidget {
  final String title;
  final String link;
  final bool isTopRounded;
  final bool isBottomRounded;
  const ProfileScreenSocialLinksTile({
    super.key,
    required this.title,
    required this.link,
    this.isTopRounded = false,
    this.isBottomRounded = false,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileScreenTile(
      title: title,
      subtitle: link,
      trailing: Image.asset(
        'assets/icons/arrow_forward.png',
        width: 23,
        color: Theme.of(context).colorScheme.primary,
      ),
      isBottomRounded: isBottomRounded,
      isTopRounded: isTopRounded,
      onTap: () {},
    );
  }
}
