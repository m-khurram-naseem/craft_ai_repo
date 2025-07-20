import 'package:craft_ai/views/profile_screen/widgets/profile_screen_tile.dart';
import 'package:flutter/material.dart';

class ResumeCustomizationNameTile extends StatelessWidget {
  final String name;
  const ResumeCustomizationNameTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    if (name.isEmpty) {
      return SliverToBoxAdapter(child: SizedBox());
    }
    return ProfileScreenTile(
      leading: Image.asset(
        'assets/icons/id_card.png',
        width: 23,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: name,
      isTopRounded: true,
    );
  }
}

class ResumeCustomizationDesignationTile extends StatelessWidget {
  final String designation;
  const ResumeCustomizationDesignationTile({
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
    );
  }
}

class ResumeCustomizationEmailTile extends StatelessWidget {
  final String email;
  const ResumeCustomizationEmailTile({super.key, required this.email});

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

class ResumeCustomizationPhoneNoTile extends StatelessWidget {
  final String phoneNo;
  const ResumeCustomizationPhoneNoTile({super.key, required this.phoneNo});

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

class ResumeCustomizationAddressTile extends StatelessWidget {
  final String address;
  const ResumeCustomizationAddressTile({super.key, required this.address});

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
