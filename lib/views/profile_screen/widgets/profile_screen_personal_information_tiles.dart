import 'package:craft_ai/views/profile_screen/widgets/profile_screen_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreenPersonalInformationDesignationTile extends StatelessWidget {
  final String designation;
  const ProfileScreenPersonalInformationDesignationTile({
    super.key,
    required this.designation,
  });

  @override
  Widget build(BuildContext context) {
    if (designation.isEmpty) {
      return SliverToBoxAdapter(child: SizedBox());
    }
    return ProfileScreenTile(
      leading: Image.asset(
        'assets/icons/manager.png',
        width: 23,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: designation,
      isTopRounded: true,
    );
  }
}

class ProfileScreenPersonalInformationEmailTile extends StatelessWidget {
  final String email;
  const ProfileScreenPersonalInformationEmailTile({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    if (email.isEmpty) {
      return SliverToBoxAdapter(child: SizedBox());
    }
    return ProfileScreenTile(
      leading: Image.asset(
        'assets/icons/email.png',
        width: 23,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: email,
    );
  }
}

class ProfileScreenPersonalInformationPhoneNoTile extends StatelessWidget {
  final String phoneNo;
  const ProfileScreenPersonalInformationPhoneNoTile({
    super.key,
    required this.phoneNo,
  });

  @override
  Widget build(BuildContext context) {
    if (phoneNo.isEmpty) {
      return SliverToBoxAdapter(child: SizedBox());
    }
    return ProfileScreenTile(
      leading: Image.asset(
        'assets/icons/phone.png',
        width: 23,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: phoneNo,
    );
  }
}

class ProfileScreenPersonalInformationAddressTile extends StatelessWidget {
  final String address;
  const ProfileScreenPersonalInformationAddressTile({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    if (address.isEmpty) {
      return SliverToBoxAdapter(child: SizedBox());
    }
    return ProfileScreenTile(
      leading: Image.asset(
        'assets/icons/location.png',
        width: 23,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: address,
      isBottomRounded: true,
    );
  }
}
