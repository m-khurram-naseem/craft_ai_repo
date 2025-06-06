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
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverToBoxAdapter(
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius:
                isTopRounded
                    ? BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )
                    : isBottomRounded
                    ? BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )
                    : BorderRadius.zero,
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
