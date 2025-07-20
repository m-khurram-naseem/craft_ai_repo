import 'package:craft_ai/controllers/templates_controller/templates_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResumeChipRow extends ConsumerWidget {  
  final void Function(int value) onChipTap;
  const ResumeChipRow({super.key , required this.onChipTap}); 

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    ref.watch(templatesStateNotifierProvider);
    return SliverPadding(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
      sliver: SliverToBoxAdapter(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8,
            children: [
              for(var i = 0 ; i < 5; i++)
              ChipWidget(value: i, isSelected: i == ref.read(templatesStateNotifierProvider.notifier).selectedChip, onTap: onChipTap),              
            ],
          ),
        ),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  final int value;
  final bool isSelected;
  final void Function(int value) onTap;
  const ChipWidget({super.key, required this.value, this.isSelected = false , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(value),
      child: Chip(      
        label: Text(
          getChipNameFormValue(value),
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontFamily: 'Urbanist',
          ),
        ),      
        backgroundColor:
            isSelected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.onSecondary,
        side: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 1,
        shadowColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

String getChipNameFormValue(int value) {
  return switch (value) {
    0 => 'All',
    1 => 'Conventional',
    2 => 'Modern',
    3 => 'Classic',
    4 => 'Simple',
    _ => '',
  };
}
