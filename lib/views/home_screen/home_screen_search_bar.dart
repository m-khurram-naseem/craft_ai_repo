import 'package:flutter/material.dart';

class HomeScreenSearchBar extends StatefulWidget {
  const HomeScreenSearchBar({super.key});

  @override
  State<HomeScreenSearchBar> createState() => _HomeScreenSearchBarState();
}

class _HomeScreenSearchBarState extends State<HomeScreenSearchBar> {
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
