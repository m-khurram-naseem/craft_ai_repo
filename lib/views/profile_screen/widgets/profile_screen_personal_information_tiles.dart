import 'package:craft_ai/views/profile_screen/widgets/profile_screen_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreenPersonalInformationDesignationTile extends StatelessWidget {
  const ProfileScreenPersonalInformationDesignationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreenTile(
      leading: Image.asset(
        'assets/icons/manager.png',
        width: 23,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: 'Software Engineer',
      isTopRounded: true,
    );
  }
}

class ProfileScreenPersonalInformationEmailTile extends StatelessWidget {
  const ProfileScreenPersonalInformationEmailTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreenTile(
      leading: Image.asset(
        'assets/icons/email.png',
        width: 23,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: 'developerkhurramnaseem@gmail.com',
    );
  }
}

class ProfileScreenPersonalInformationPhoneNoTile extends StatelessWidget {
  const ProfileScreenPersonalInformationPhoneNoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreenTile(
      leading: Image.asset(
        'assets/icons/phone.png',
        width: 23,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: '+92-301-7731831',
    );
  }
}

class ProfileScreenPersonalInformationAddressTile extends StatelessWidget {
  const ProfileScreenPersonalInformationAddressTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreenTile(
      leading: Image.asset(
        'assets/icons/location.png',
        width: 23,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: 'Bahawalpur, Pakistan',
      isBottomRounded: true,
    );
  }
}
