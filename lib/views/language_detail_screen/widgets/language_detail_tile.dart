import 'package:flutter/material.dart';

class LanguageDetailTile extends StatelessWidget {
  final Widget? trailing;
  final String title;
  final String? subtitle;
  final bool isTopRounded;
  final bool isBottomRounded;
  final bool isElevated;
  final void Function()? onEditTap;
  const LanguageDetailTile({
    super.key,
    this.trailing,
    required this.title,
    this.subtitle,
    this.isElevated = false,
    this.onEditTap,
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
          trailing: GestureDetector(onTap: onEditTap, child: trailing),
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
