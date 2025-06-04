import 'package:craft_ai/models/resume_template.dart';
import 'package:craft_ai/views/resume_templates_screen/resume_templates_screen_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResumeTemplatesScreen extends StatelessWidget {
  final List<ResumeTemplate> templates;
  const ResumeTemplatesScreen({super.key, required this.templates});

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
                SliverPadding(
                  padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                  sliver: SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 8,
                        children: [
                          Chip(
                            label: Text(
                              'Conventional',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.onSecondary,
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 1,
                            shadowColor: Theme.of(context).colorScheme.primary,
                          ),
                          Chip(
                            label: Text(
                              'Traditional',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.onSecondary,
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 1,
                            shadowColor: Theme.of(context).colorScheme.primary,
                          ),
                          Chip(
                            label: Text(
                              'Modern',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.onSecondary,
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 1,
                            shadowColor: Theme.of(context).colorScheme.primary,
                          ),
                          Chip(
                            label: Text(
                              'Simple',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.onSecondary,
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 1,
                            shadowColor: Theme.of(context).colorScheme.primary,
                          ),
                          Chip(
                            label: Text(
                              'Classic',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.onSecondary,
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 1,
                            shadowColor: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 20,
                    children: [
                      for (var i = 0; i < 5; i++)
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/demo_resume.png',
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  showCupertinoSheet(
                                    context: context,
                                    pageBuilder:
                                        (context) => Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.secondary,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              AppBar(
                                                automaticallyImplyLeading:
                                                    false,
                                                title: Text(
                                                  'Preview',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Urbanist',
                                                  ),
                                                ),
                                                actions: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                        8.0,
                                                      ),
                                                      child: Icon(Icons.close),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Image.asset(
                                                'assets/images/demo_resume.png',
                                                fit: BoxFit.scaleDown,
                                              ),
                                            ],
                                          ),
                                        ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary
                                            .withAlpha(150),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.fullscreen,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
