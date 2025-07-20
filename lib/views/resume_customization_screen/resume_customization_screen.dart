import 'package:craft_ai/controllers/pdf_controller/pdf_providers.dart';
import 'package:craft_ai/controllers/profile_controller/profile_providers.dart';
import 'package:craft_ai/models/template.dart';
import 'package:craft_ai/models/user_data.dart';
import 'package:craft_ai/services/pdf_service/pdf_service.dart';
import 'package:craft_ai/utils/template_utils/template_customization_util.dart';
import 'package:craft_ai/views/resume_customization_screen/widgets/resume_customization_backscreen.dart';
import 'package:craft_ai/views/resume_templates_screen/widgets/resume_chip_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ResumeCustomizationScreen extends ConsumerWidget {
  final Template template;  
  final UserData? userData;
  const ResumeCustomizationScreen({super.key, required this.template , this.userData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(userData != null){
      return ResumeCustomizationScreenLoaded(
            template: template,
            userData: userData!,
          );
    }
    var asyncValue = ref.watch(profileStreamProvider);
    return asyncValue.when(
      data:
          (data) => ResumeCustomizationScreenLoaded(
            template: template,
            userData: data,
          ),
      loading: () {
        return Center(
          child: LoadingAnimationWidget.threeRotatingDots(
            color: Theme.of(context).colorScheme.primary,
            size: 25,
          ),
        );
      },
      error: (error, stackTrace) => const SizedBox(),
    );
  }
}

class ResumeCustomizationScreenLoaded extends ConsumerStatefulWidget {
  final Template template;
  final UserData userData;
  const ResumeCustomizationScreenLoaded({
    super.key,
    required this.template,
    required this.userData,
  });

  @override
  ConsumerState<ResumeCustomizationScreenLoaded> createState() =>
      _ResumeCustomizationScreenLoadedState();
}

class _ResumeCustomizationScreenLoadedState
    extends ConsumerState<ResumeCustomizationScreenLoaded>
    with SingleTickerProviderStateMixin {
  String editedHtml = '';
  late WebViewController controller;
  late AnimationController animationController;
  late Animation<double> sizeTransition;
  late Animation<double> editIconOpacityAnimation;
  late Animation<double> eyeIconOpacityAnimation;
  late Animation<double> saveBtnOpacityAnimation;
  late Animation<double> borderRadiusAnimation;
  bool showWebView = true;

  @override
  void initState() {
    super.initState();

    // Web View Controller
    controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    editedHtml = TemplateCustomizationUtil.populateHtmlWithData(
      widget.userData,
      widget.template.html,
    );
    controller.loadHtmlString(editedHtml);

    // Animation Controller
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..addListener(() {
      setState(() {});
      if (animationController.status == AnimationStatus.completed ||
          animationController.status == AnimationStatus.dismissed) {
        setState(() {});
      }
    });
    sizeTransition = Tween(begin: 1.0, end: 0.35).animate(animationController);
    editIconOpacityAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.7, curve: Curves.linear),
      ),
    );
    eyeIconOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.4, 1.0, curve: Curves.linear),
      ),
    );
    borderRadiusAnimation = Tween(begin: 0.0, end: 25.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.4, 1.0, curve: Curves.linear),
      ),
    );
    saveBtnOpacityAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.6, curve: Curves.linear),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          ScaffoldMessenger.of(context).clearMaterialBanners();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(getChipNameFormValue(widget.template.type)),
          actions: [
            GestureDetector(
              onTap: () async {
                if (animationController.status == AnimationStatus.completed) {
                  setState(() {
                    showWebView = !showWebView;
                  });
                } else if (animationController.status ==
                    AnimationStatus.dismissed) {
                  animationController.forward();
                }
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  FadeTransition(
                    opacity: editIconOpacityAnimation,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.edit_outlined),
                    ),
                  ),
                  FadeTransition(
                    opacity: eyeIconOpacityAnimation,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        showWebView
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Center(
          child: Stack(
            children: [
              ResumeCustomizationBackscreen(
                userData: widget.userData,
                update: (userData) {
                  editedHtml = TemplateCustomizationUtil.populateHtmlWithData(
                    userData,
                    widget.template.html,
                  );
                  controller.loadHtmlString(editedHtml);
                },
              ),
              if (showWebView)
                ScaleTransition(
                  scale: sizeTransition,
                  alignment: Alignment.bottomRight,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.onSecondary,
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(
                            borderRadiusAnimation.value,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            borderRadiusAnimation.value,
                          ),
                          child: WebViewWidget(controller: controller),
                        ),
                      ),
                      if (animationController.status ==
                          AnimationStatus.completed)
                        GestureDetector(
                          onTap: () => animationController.reverse(),
                          child: Align(
                            alignment: Alignment.center,
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
                                  size: 70,
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
        floatingActionButton: FadeTransition(
          opacity: saveBtnOpacityAnimation,
          child: IgnorePointer(
            ignoring: animationController.status == AnimationStatus.completed,
            child: FloatingActionButton.extended(
              onPressed: () async {
                // ScaffoldMessenger.of(
                //   context,
                // ).showMaterialBanner(ResumeCustomizationBanner(context: context));
                var navigator = Navigator.of(context);
                await PdfService().savePdf(
                  editedHtml,
                  widget.template.html,
                  DateTime.now().millisecondsSinceEpoch.toString(),
                );
                ref.read(pdfStateProvider.notifier).fetchAllPdfs();                
                navigator
                  ..pop()
                  ..pop();
              },
              backgroundColor: Theme.of(context).colorScheme.onSecondary,
              label: Text(
                'Save',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: Image.asset(
                'assets/icons/save.png',
                color: Theme.of(context).colorScheme.primary,
                width: 23,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
