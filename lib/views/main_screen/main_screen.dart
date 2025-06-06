import 'package:craft_ai/views/ats_score_screen/ats_score_screen.dart';
import 'package:craft_ai/views/home_screen/home_screen.dart';
import 'package:craft_ai/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Row(
          children: [
            Text(
              'Craft AI',
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          if (currentIndex == 0)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                // Icons.grid_view_outlined,
                Icons.view_agenda_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          if (currentIndex == 0)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications_none_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
        ],
      ),
      body: Center(
        child: PageView(
          controller: controller,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          children: [HomeScreen(), AtsScoreScreen(), ProfileScreen()],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          elevation: 0.0,
          currentIndex: currentIndex,
          onTap: (value) {
            controller.animateToPage(
              value,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear,
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: BottomBarItemWidget(
                iconPath: 'assets/icons/home_outlined.png',
              ),
              activeIcon: BottomBarItemWidget(
                iconPath: 'assets/icons/home.png',
                isActiveIcon: true,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: BottomBarItemWidget(
                iconPath: 'assets/icons/score_outlined.png',
                width: 25,
              ),
              activeIcon: BottomBarItemWidget(
                iconPath: 'assets/icons/score.png',
                isActiveIcon: true,
                width: 25,
              ),
              label: 'ATS',
            ),
            BottomNavigationBarItem(
              icon: BottomBarItemWidget(
                iconPath: 'assets/icons/user_outlined.png',
              ),
              activeIcon: BottomBarItemWidget(
                iconPath: 'assets/icons/user.png',
                isActiveIcon: true,
              ),
              label: 'ATS',
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarItemWidget extends StatelessWidget {
  final String iconPath;
  final bool isActiveIcon;
  final double width;
  const BottomBarItemWidget({
    super.key,
    required this.iconPath,
    this.isActiveIcon = false,
    this.width = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isActiveIcon
                ? Theme.of(context).colorScheme.onSecondary
                : Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(9),
      ),
      padding: EdgeInsets.all(width == 20 ? 8.0 : 6.0),
      child: Image.asset(
        iconPath,
        color: Theme.of(context).colorScheme.primary,
        width: width,
      ),
    );
  }
}
