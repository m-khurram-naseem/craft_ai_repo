import 'package:flutter/material.dart';

class ResumeCustomizationBanner extends MaterialBanner{
  ResumeCustomizationBanner({super.key, required BuildContext context}):super(backgroundColor: Theme.of(context).colorScheme.onSecondary,
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
                ],);

}