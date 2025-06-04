import 'package:flutter/material.dart';

class AtsScoreScreen extends StatelessWidget {
  const AtsScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Job Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Urbanist',
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              sliver: SliverToBoxAdapter(
                child: TextFormField(
                  maxLines: 10,
                  minLines: 2,
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    color: Theme.of(context).colorScheme.surface,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    hintText: 'Write job description here...',
                    hintStyle: TextStyle(
                      fontFamily: 'Urbanist',
                      color: Theme.of(
                        context,
                      ).colorScheme.surface.withAlpha(130),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Resume Score',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Urbanist',
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Suggestions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Urbanist',
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(childCount: 5, (
                context,
                index,
              ) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 5,
                  ),
                  child: ListTile(
                    tileColor: Theme.of(context).colorScheme.onSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    leading: Icon(
                      Icons.earbuds_sharp,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      'Include details about team leadership, mentorship roles, or collaborative work environments.',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,

                        fontFamily: 'Uranist',
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            onPressed: () {},
            heroTag: 1,
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            foregroundColor: Theme.of(context).colorScheme.surface,
            elevation: 1,
            icon: Icon(
              Icons.workspaces_outlined,
              color: Theme.of(context).colorScheme.surface,
            ),
            label: Text(
              'Select Resume',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          SizedBox(height: 10),
          FloatingActionButton.extended(
            onPressed: () {},
            heroTag: 2,
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            foregroundColor: Theme.of(context).colorScheme.surface,
            elevation: 1,
            icon: Icon(
              Icons.upload_outlined,
              color: Theme.of(context).colorScheme.surface,
            ),
            label: Text(
              'Upload Resume',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
