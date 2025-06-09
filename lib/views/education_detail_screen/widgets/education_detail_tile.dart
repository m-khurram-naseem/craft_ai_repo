import 'package:flutter/material.dart';

class EducationDetailTile extends StatelessWidget {
  final Widget? trailing;
  final String title;
  final String? subtitle;
  final bool isTopRounded;
  final bool isBottomRounded;
  final void Function()? onEditTap;
  const EducationDetailTile({
    super.key,
    this.trailing,
    required this.title,
    this.subtitle,
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
            borderRadius: BorderRadius.only(
              topLeft: isTopRounded ? Radius.circular(15) : Radius.zero,
              topRight: isTopRounded ? Radius.circular(15) : Radius.zero,
              bottomLeft: isBottomRounded ? Radius.circular(15) : Radius.zero,
              bottomRight: isBottomRounded ? Radius.circular(15) : Radius.zero,
            ),
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
