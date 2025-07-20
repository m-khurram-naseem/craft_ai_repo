import 'package:craft_ai/controllers/templates_controller/templates_providers.dart';
import 'package:craft_ai/models/resume_template.dart';
import 'package:craft_ai/views/resume_templates_screen/widgets/resume_chip_row.dart';
import 'package:craft_ai/views/resume_templates_screen/widgets/resume_templates_list.dart';
import 'package:craft_ai/views/resume_templates_screen/widgets/resume_templates_screen_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResumeTemplatesScreen extends ConsumerStatefulWidget {
  final List<ResumeTemplate> templates;
  const ResumeTemplatesScreen({super.key, required this.templates});

  @override
  ConsumerState<ResumeTemplatesScreen> createState() =>
      _ResumeTemplatesScreenState();
}

class _ResumeTemplatesScreenState extends ConsumerState<ResumeTemplatesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) =>
          ref.read(templatesStateNotifierProvider.notifier).fetchTemplates(0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Templates'), elevation: 0.0),
      body: Center(
        child: Hero(
          tag: 'NewResume',
          child: Material(
            color: Theme.of(context).colorScheme.secondary,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(left: 12, right: 12, bottom: 10),
                  sliver: ResumeTemplatesScreenSearchBar(),
                ),
                ResumeChipRow(
                  onChipTap: (value) {
                    ref
                        .read(templatesStateNotifierProvider.notifier)
                        .fetchTemplates(value);
                  },
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  sliver: ResumeTemplatesList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
