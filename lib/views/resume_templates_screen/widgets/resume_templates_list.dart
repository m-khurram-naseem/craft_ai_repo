import 'package:craft_ai/controllers/templates_controller/templates_providers.dart';
import 'package:craft_ai/controllers/templates_controller/templates_states.dart';
import 'package:craft_ai/views/resume_customization_screen/resume_customization_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ResumeTemplatesList extends ConsumerWidget {
  const ResumeTemplatesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(templatesStateNotifierProvider);
    if (state is TemplateLoadedState) {
      return SliverGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        childAspectRatio: 0.8,
        mainAxisSpacing: 20,
        children: [
          for (var i = 0; i < state.templates.length; i++)
            GestureDetector(
              onTap: () async {
                var navigator = Navigator.of(context);
                navigator.push(
                  CupertinoPageRoute(
                    builder:
                        (context) => ResumeCustomizationScreen(
                          template: state.templates[i],
                        ),
                  ),
                );
              },
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(state.templates[i].imageUrl),
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
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppBar(
                                      automaticallyImplyLeading: false,
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
                                            Navigator.of(context).pop();
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.close),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image.network(
                                      state.templates[i].imageUrl,
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
                              color: Theme.of(
                                context,
                              ).colorScheme.onSecondary.withAlpha(150),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.fullscreen,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      );
    } else if (state is TemplateLoadingState) {
      return SliverFillRemaining(
        child: Center(
          child: LoadingAnimationWidget.threeRotatingDots(
            color: Theme.of(context).colorScheme.primary,
            size: 25,
          ),
        ),
      );
    }
    return SliverToBoxAdapter(child: SizedBox());
  }
}
