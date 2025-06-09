
import 'package:flutter/material.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ResumeCustomizationScreen extends StatefulWidget {
  final String html;
  const ResumeCustomizationScreen({super.key, required this.html});

  @override
  State<ResumeCustomizationScreen> createState() =>
      _ResumeCustomizationScreenState();
}

class _ResumeCustomizationScreenState extends State<ResumeCustomizationScreen>
    with SingleTickerProviderStateMixin {
  String html = '';
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

    controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    html = widget.html;
    userData.forEach((key, value) {
      html = html.replaceAll('{{$key}}', value);
    });
    controller.loadHtmlString(html);

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

  var userData = {
    'name': 'M. Khuram Naseem',
    'email': 'developerkhurramnaseem@gmail.com',
    'phoneNo': '+92-301-7731831',
    'linkedInLink': 'https://www.linkedin.com/in/m-khuram-naseem',
    'summary':
        ' Flutter Developer with 2 years of hands-on experience, combining technical expertise with creative problem-solving to deliver high-quality mobile applications. Successfully developed and deployed 3 feature-rich apps while actively mentoring team members and resolving complex development challenges.',
    'jobDesignation': 'Software Engineer',
    'enterpriseName': 'Saya Coorporation Ltd.',
    'startDate': 'Aug 2021',
    'endDate': 'Present',
    'description1':
        'Improved app performance by 30% via optimization techniques',
    'description2':
        'Developed and maintained 10+ cross platform apps using Flutter',
    'description3': 'Implemented RESTful APIs and Firebase Integration',
    'degreeName': 'BS Software Engineering',
    'instituteName': 'The Islamia University, Bahawalpur',
  };

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
          title: Text('Name'),
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
              CustomScrollView(slivers: <Widget>[
                
              ],
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
                          border:
                          // animationController.status ==
                          //         AnimationStatus.completed
                          // ?
                          Border.all(
                            color: Theme.of(context).colorScheme.onSecondary,
                            width: 5,
                          ),
                          // : Border.all(width: 0.0),
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
                var direcotry = await getApplicationDocumentsDirectory();
                await FlutterHtmlToPdf.convertFromHtmlContent(
                  html,
                  direcotry.path,
                  'resume_4',
                );
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

// class WorkshopTimeBallAssist extends StatefulWidget {
//   final Widget child;
//   const WorkshopTimeBallAssist({super.key, required this.child});

//   @override
//   State<WorkshopTimeBallAssist> createState() => _WorkshopTimeBallAssistState();
// }

// class _WorkshopTimeBallAssistState extends State<WorkshopTimeBallAssist>
//     with TickerProviderStateMixin {
//   // Spring Animation Controller => Ball Movement Controller
//   late AnimationController ballMovementController;
//   late Animation<Alignment> _animation;
//   // On Button tap Animation Controller
//   late AnimationController ballTapAnimationController;

//   // Constants
//   static const _movementAnimationDuration = Duration(milliseconds: 200);
//   static const _tapAnimationDuration = Duration(milliseconds: 500);
//   static const _startAlignment = Alignment(1, -0.5);
//   static const _springDescription = SpringDescription(
//     mass: 30,
//     stiffness: 1,
//     damping: 1,
//   );
//   static const _backCircleOpaque = 0.8, _frontCircleOpaque = 0.8;
//   static const _backCircleTransparent = 0.4, _frontCircleTransparent = 0.6;
//   static const _forBottomHeightPercent = 0.8,
//       _widthPercentHalf = 0.5,
//       _forTopHeightPercent = 0.2,
//       _heightPercentHalf = 0.5;

//   // Instances
//   double backOpacity = _backCircleTransparent,
//       frontOpacity = _frontCircleTransparent;
//   Alignment _currentAlignment = Alignment.center;
//   Alignment _ballAlignment = Alignment.topRight;

//   @override
//   void initState() {
//     super.initState();
//     _currentAlignment = _startAlignment;
//     ballMovementController = AnimationController(
//       vsync: this,
//       duration: _movementAnimationDuration,
//     )..addListener(() {
//       setState(() {
//         _currentAlignment = _animation.value;
//       });
//     });
//     ballTapAnimationController = AnimationController(
//       vsync: this,
//       duration: _tapAnimationDuration,
//     );
//   }

//   // Function that runs ball movement animation
//   _runAnimation(Offset endOffset, Offset pixelsPerSecond, Size size) {
//     _animation = alignmentAnimation(endOffset, size);
//     _ballAlignment = ballAlignment(endOffset, size);
//     final unitsPerSecondX = pixelsPerSecond.dx / size.width;
//     final unitsPerSecondY = pixelsPerSecond.dy / size.height;
//     final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
//     final unitVelocity = unitsPerSecond.distance;

//     final simulation = SpringSimulation(
//       _springDescription,
//       0,
//       1,
//       -unitVelocity,
//     );

//     ballMovementController.animateWith(simulation);
//     ballMovementController.reset();
//     ballMovementController.forward();
//     Future.delayed(const Duration(seconds: 1), () {
//       setState(() {
//         backOpacity = _backCircleTransparent;
//         frontOpacity = _frontCircleTransparent;
//       });
//     });
//   }

//   // Get us current alignment for ball based on ending offset of panUpdate and available size
//   Animation<Alignment> alignmentAnimation(Offset endOffset, Size size) {
//     var xDifference = endOffset.dx;
//     var yDifference = endOffset.dy;
//     Alignment endAlignment;
//     if (xDifference < size.width * _widthPercentHalf) {
//       if (yDifference > size.height * _forBottomHeightPercent) {
//         endAlignment = const Alignment(-1, 0.8);
//       } else if (yDifference < size.height * _forTopHeightPercent) {
//         endAlignment = const Alignment(-1, -0.7);
//       } else {
//         endAlignment = Alignment(-1, _currentAlignment.y);
//       }
//     } else {
//       // Ball animation
//       if (yDifference > size.height * _forBottomHeightPercent) {
//         endAlignment = const Alignment(1, 0.8);
//       } else if (yDifference < size.height * _forTopHeightPercent) {
//         endAlignment = const Alignment(1, -0.7);
//       } else {
//         endAlignment = Alignment(1, _currentAlignment.y);
//       }
//     }
//     return ballMovementController.drive(
//       AlignmentTween(begin: _currentAlignment, end: endAlignment),
//     );
//   }

//   // Get us ball alignment on previous circle/container => which shows actual data
//   Alignment ballAlignment(Offset endOffset, Size size) {
//     var xDifference = endOffset.dx;
//     var yDifference = endOffset.dy;
//     if (xDifference < size.width * _widthPercentHalf) {
//       return yDifference > size.height * _heightPercentHalf
//           ? Alignment.bottomLeft
//           : Alignment.topLeft;
//     }
//     return yDifference > size.height * _heightPercentHalf
//         ? Alignment.bottomRight
//         : Alignment.topRight;
//   }

//   // Gesture Detector events
//   void _onPanDown(DragDownDetails details) {
//     ballMovementController.stop();
//   }

//   void _onPanStart(DragStartDetails details) {
//     setState(() {
//       backOpacity = _backCircleOpaque;
//       frontOpacity = _frontCircleOpaque;
//     });
//   }

//   void _onPanEnd(DragEndDetails details) {
//     final size = MediaQuery.sizeOf(context);
//     _runAnimation(
//       details.globalPosition,
//       details.velocity.pixelsPerSecond,
//       size,
//     );
//   }

//   void _onPanUpdate(DragUpdateDetails details) {
//     final size = MediaQuery.sizeOf(context);
//     setState(() {
//       _currentAlignment += Alignment(
//         details.delta.dx / (size.width * _widthPercentHalf),
//         details.delta.dy / (size.height * _heightPercentHalf),
//       );
//     });
//   }

//   void _onTap() {
//     HapticFeedback.vibrate();
//     if (ballTapAnimationController.isCompleted) {
//       setState(() {
//         ballTapAnimationController.reverse();
//         backOpacity = _backCircleTransparent;
//         frontOpacity = _frontCircleTransparent;
//       });
//     } else {
//       setState(() {
//         backOpacity = _backCircleOpaque;
//         frontOpacity = _frontCircleOpaque;
//         ballTapAnimationController.forward();
//       });
//     }
//   }

//   @override
//   void dispose() {
//     ballMovementController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _onTap,
//       onPanUpdate: _onPanUpdate,
//       onPanDown: _onPanDown,
//       onPanEnd: _onPanEnd,
//       onPanStart: _onPanStart,
//       child: Align(
//         alignment: _currentAlignment,
//         child: Stack(alignment: _ballAlignment, children: [widget.child]),
//       ),
//     );
//   }
// }
