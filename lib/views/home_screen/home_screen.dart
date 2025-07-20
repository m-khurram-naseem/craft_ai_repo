import 'package:craft_ai/controllers/pdf_controller/pdf_providers.dart';
import 'package:craft_ai/views/home_screen/home_screen_search_bar.dart';
import 'package:craft_ai/views/home_screen/widgets/home_screen_list.dart';
import 'package:craft_ai/views/resume_templates_screen/resume_templates_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(pdfStateProvider.notifier).fetchAllPdfs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: PopScope(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          body: Center(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(left: 12, right: 12, bottom: 20),
                  sliver: HomeScreenSearchBar(),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  sliver: HomeScreenFilesList(),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResumeTemplatesScreen(templates: []),
                ),
              );
            },
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            foregroundColor: Theme.of(context).colorScheme.surface,
            heroTag: 'NewResume',
            elevation: 1,
            icon: Icon(
              Icons.edit_outlined,
              color: Theme.of(context).colorScheme.surface,
            ),
            label: Text(
              'New Resume',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
