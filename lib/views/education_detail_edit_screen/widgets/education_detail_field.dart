import 'package:flutter/material.dart';

class EducationDetailField extends StatelessWidget {
  final String hint;
  final bool isDateField;
  final TextEditingController controller;
  final DateTime? selectedDate;
  final void Function(DateTime value)? onChanged;
  const EducationDetailField({
    super.key,
    required this.hint,
    this.isDateField = false,
    required this.controller,
    this.onChanged,
    this.selectedDate,
  });

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
            suffixIcon:
                isDateField
                    ? GestureDetector(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                          currentDate: selectedDate,
                        ).then((value) {
                          if (value != null) {
                            if (onChanged != null) {
                              onChanged!(value);
                            }
                          }
                        });
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
