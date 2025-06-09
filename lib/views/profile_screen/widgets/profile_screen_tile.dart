import 'dart:developer';

import 'package:flutter/material.dart';

class ProfileScreenTile extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final String title;
  final String? subtitle;
  final bool isTopRounded;
  final bool isBottomRounded;
  final void Function()? onTap;
  const ProfileScreenTile({
    super.key,
    this.leading,
    this.trailing,
    required this.title,
    this.subtitle,
    this.onTap,
    this.isTopRounded = false,
    this.isBottomRounded = false,
  });

  @override
  Widget build(BuildContext context) {
    log(isBottomRounded.toString());
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverToBoxAdapter(
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: isTopRounded ? Radius.circular(15) : Radius.zero,
              topRight: isTopRounded ? Radius.circular(15) : Radius.zero,
              bottomLeft: isBottomRounded ? Radius.circular(15) : Radius.zero,
              bottomRight: isBottomRounded ? Radius.circular(15) : Radius.zero,
            ),
          ),
          trailing: trailing,
          subtitle:
              subtitle != null
                  ? Text(
                    subtitle ?? '',
                    style: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withAlpha(150),
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                  : null,
          tileColor: Theme.of(context).colorScheme.onSecondary,
          leading: leading,
          onTap: onTap,
          title: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
