
import 'package:craft_ai/controllers/pdf_controller/pdf_providers.dart';
import 'package:craft_ai/controllers/pdf_controller/pdf_states.dart';
import 'package:craft_ai/utils/comman_widgets/no_data_found_widget.dart';
import 'package:craft_ai/views/home_screen/widgets/home_screen_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreenFilesList extends ConsumerWidget {
  const HomeScreenFilesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(pdfStateProvider);
    if (state is PdfLoadingstate) {
      return SliverFillRemaining(
        child: Center(
          child: LoadingAnimationWidget.threeRotatingDots(
            color: Theme.of(context).colorScheme.primary,
            size: 25,
          ),
        ),
      );
    } else if (state is PdfErrorState) {
      return SliverToBoxAdapter(
        child: SizedBox(child: Text(state.message.toString())),
      );
    } else if (state is PdfLoadedState) {
      if (state.pdfs.isEmpty) {
        return SliverFillRemaining(
          child: NoDataFoundWidget(errorMessage: 'No Resume Found'),
        );
      }
      return SliverGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        childAspectRatio: 0.8,
        mainAxisSpacing: 20,
        children: [
          for (var i = 0; i < state.pdfs.length; i++)
            HomeScreenListTile(pdf: state.pdfs[i],)
        ],
      );
    }
    return SliverToBoxAdapter(child: SizedBox());
  }

  
}
