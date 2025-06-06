import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AtsFloatingBtns extends StatefulWidget {
  final void Function() aiScoreOnTap;
  final void Function() apiScoreOnTap;
  final bool isLoading;
  const AtsFloatingBtns({
    super.key,
    required this.aiScoreOnTap,
    required this.apiScoreOnTap,
    required this.isLoading,
  });

  @override
  State<AtsFloatingBtns> createState() => _AtsFloatingBtnsState();
}

class _AtsFloatingBtnsState extends State<AtsFloatingBtns>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> aiButtonAnimation;
  late Animation<double> apiButtonAnimation;
  late Animation<double> menuIconAnimation;
  late Animation<double> closeIconAnimation;
  late Animation<double> iconRotation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    )..addListener(() => setState(() {}));
    aiButtonAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 0.7, curve: Curves.linear),
      ),
    );
    apiButtonAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.4, 1, curve: Curves.linear),
      ),
    );
    menuIconAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 0.7, curve: Curves.linear),
      ),
    );
    closeIconAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.4, 1, curve: Curves.linear),
      ),
    );
    iconRotation = Tween<double>(begin: 0, end: 0.25).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 0.9, curve: Curves.linear),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 8,
      children: [
        IgnorePointer(
          ignoring: animationController.status == AnimationStatus.dismissed,
          child: FadeTransition(
            opacity: apiButtonAnimation,
            alwaysIncludeSemantics: true,
            child: FloatingActionButton(
              onPressed: () {
                animationController.reverse();
                widget.apiScoreOnTap();
              },

              backgroundColor: Theme.of(context).colorScheme.onSecondary,
              elevation: 1,
              isExtended: false,
              child: Image.asset(
                'assets/icons/ai.png',
                color: Theme.of(context).colorScheme.primary,
                width: 25,
              ),
            ),
          ),
        ),
        IgnorePointer(
          ignoring: animationController.status == AnimationStatus.dismissed,
          child: FadeTransition(
            opacity: aiButtonAnimation,
            alwaysIncludeSemantics: true,
            child: FloatingActionButton(
              onPressed: () {
                animationController.reverse();
                widget.aiScoreOnTap();
              },
              backgroundColor: Theme.of(context).colorScheme.onSecondary,
              elevation: 1,
              isExtended: false,
              child: Image.asset(
                'assets/icons/scoreboard.png',
                color: Theme.of(context).colorScheme.primary,
                width: 25,
              ),
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            if (animationController.status == AnimationStatus.completed) {
              animationController.reverse();
            } else if (animationController.status ==
                AnimationStatus.dismissed) {
              animationController.forward();
            }
          },
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          elevation: 1,
          isExtended: false,
          child:
              widget.isLoading
                  // ? CupertinoActivityIndicator(
                  //   color: Theme.of(context).colorScheme.primary,
                  // )
                  ? LoadingAnimationWidget.threeRotatingDots(
                    color: Theme.of(context).colorScheme.primary,
                    size: 25,                    
                  )
                  : RotationTransition(
                    turns: iconRotation,
                    child: Stack(
                      children: [
                        FadeTransition(
                          opacity: menuIconAnimation,
                          child: Icon(
                            Icons.menu,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        FadeTransition(
                          opacity: closeIconAnimation,
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
        ),
      ],
    );
  }
}
