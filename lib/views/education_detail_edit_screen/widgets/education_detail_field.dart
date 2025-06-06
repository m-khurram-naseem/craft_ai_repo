import 'package:flutter/material.dart';

class EducationDetailField extends StatelessWidget {
  final String hint;
  final bool isDateField;
  const EducationDetailField({
    super.key,
    required this.hint,
    this.isDateField = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverToBoxAdapter(
        child: TextFormField(
          maxLines: 1,
          minLines: 1,
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
            suffixIcon:
                isDateField
                    ? GestureDetector(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.date_range,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    )
                    : null,
          ),
        ),
      ),
    );
  }
}
