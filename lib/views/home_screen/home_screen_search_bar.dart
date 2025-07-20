import 'package:craft_ai/controllers/pdf_controller/pdf_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenSearchBar extends ConsumerStatefulWidget {
  const HomeScreenSearchBar({super.key});

  @override
  ConsumerState<HomeScreenSearchBar> createState() =>
      _HomeScreenSearchBarState();
}

class _HomeScreenSearchBarState extends ConsumerState<HomeScreenSearchBar> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.unfocus();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SearchBar(
        focusNode: focusNode,
        autoFocus: false,
        backgroundColor: WidgetStateColor.resolveWith(
          (states) => Theme.of(context).colorScheme.onSecondary,
        ),
        shadowColor: WidgetStateColor.resolveWith(
          (states) => Theme.of(context).colorScheme.primary,
        ),
        elevation: WidgetStateProperty.resolveWith((states) => 1),
        textStyle: WidgetStateProperty.resolveWith(
          (states) => TextStyle(
            fontFamily: 'Urbanist',
            color: Theme.of(context).colorScheme.surface,
            fontWeight: FontWeight.w700,
          ),
        ),
        onChanged: (value) {
          ref.read(pdfStateProvider.notifier).updateList(value);
        },
        hintStyle: WidgetStateProperty.resolveWith(
          (states) => TextStyle(
            fontFamily: 'Urbanist',
            color: Theme.of(context).colorScheme.surface.withAlpha(130),
            fontWeight: FontWeight.w700,
          ),
        ),
        hintText: 'Search Resume Here...',
        shape: WidgetStateProperty.resolveWith(
          (states) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
