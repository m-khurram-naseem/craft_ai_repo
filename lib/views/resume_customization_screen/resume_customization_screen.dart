import 'package:flutter/material.dart';

class ResumeCustomizationScreen extends StatefulWidget {
  const ResumeCustomizationScreen({super.key});

  @override
  State<ResumeCustomizationScreen> createState() =>
      _ResumeCustomizationScreenState();
}

class _ResumeCustomizationScreenState extends State<ResumeCustomizationScreen> {
  @override
  void initState() {
    super.initState();
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.edit_outlined),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                content: Row(
                  children: [
                    Text(
                      'Complete your profile information to properly view resume...',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                forceActionsBelow: false,
                elevation: 1,
                dividerColor: Colors.transparent,
                shadowColor: Theme.of(context).colorScheme.primary,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Complete',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).clearMaterialBanners();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
