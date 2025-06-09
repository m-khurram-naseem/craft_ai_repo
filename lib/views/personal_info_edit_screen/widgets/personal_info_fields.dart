import 'package:flutter/material.dart';

class PersonalInfoField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const PersonalInfoField({super.key, required this.hint , required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverToBoxAdapter(
        child: TextFormField(
          maxLines: 1,
          minLines: 1,
          controller: controller,
          style: TextStyle(
            fontFamily: 'Urbanist',
            color: Theme.of(context).colorScheme.surface,
            fontWeight: FontWeight.w700,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            hintText: hint,
            hintStyle: TextStyle(
              fontFamily: 'Urbanist',
              color: Theme.of(context).colorScheme.surface.withAlpha(130),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
