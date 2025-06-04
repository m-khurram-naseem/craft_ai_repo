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
              icon: BottomBarItemWidget(iconData: Icons.home_outlined),
              activeIcon: BottomBarItemWidget(
                iconData: Icons.home,
                isActiveIcon: true,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: BottomBarItemWidget(iconData: Icons.score_outlined),
              activeIcon: BottomBarItemWidget(
                iconData: Icons.score,
                isActiveIcon: true,
              ),
              label: 'ATS',
            ),
            BottomNavigationBarItem(
              icon: BottomBarItemWidget(iconData: Icons.person_outline),
              activeIcon: BottomBarItemWidget(
                iconData: Icons.person,
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
  final IconData iconData;
  final bool isActiveIcon;
  const BottomBarItemWidget({
    super.key,
    required this.iconData,
    this.isActiveIcon = false,
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
      padding: EdgeInsets.all(7.0),
      child: Icon(
        iconData,
        color: Theme.of(context).colorScheme.primary,
        size: isActiveIcon ? 26 : 25,
      ),
    );
  }
}
