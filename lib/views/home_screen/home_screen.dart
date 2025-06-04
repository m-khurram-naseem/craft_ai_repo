import 'package:craft_ai/views/home_screen/home_screen_search_bar.dart';
import 'package:craft_ai/views/resume_templates_screen/resume_templates_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSecondary,
                              borderRadius: BorderRadius.circular(15),
                              
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/demo_resume.png',
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
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResumeTemplatesScreen(templates: []),));
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
