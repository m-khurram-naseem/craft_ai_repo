
import 'package:flutter/material.dart';
class LanguageDetailFluencyField extends StatelessWidget {
  final ValueChanged<int?> onChanged;
  final int selectedValue;
  const LanguageDetailFluencyField({super.key , required this.onChanged , required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverToBoxAdapter(
        child: DropdownButtonFormField(
          
          items: [
            DropdownMenuItem(value: 0, child: Text(getFluencyFromIndex(0))),
            DropdownMenuItem(value: 1, child: Text(getFluencyFromIndex(1))),
            DropdownMenuItem(value: 2, child: Text(getFluencyFromIndex(2))),
            DropdownMenuItem(value: 3, child: Text(getFluencyFromIndex(3))),
          ],
          dropdownColor: Theme.of(context).colorScheme.onSecondary,
          isExpanded: true,
          value: selectedValue,
          onChanged: onChanged,
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
            hintText: 'Enter language name here...',
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



String getFluencyFromIndex(int i){
  return switch(i){
    0 => 'Beginner' , 
    1 => 'Intermediate',
    2 => 'Fluent',
    3 => 'Native',
    _ => '',
  };
}