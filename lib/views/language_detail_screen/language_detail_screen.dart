import 'package:craft_ai/controllers/profile_controller/profile_providers.dart';
import 'package:craft_ai/models/language.dart';
import 'package:craft_ai/utils/comman_widgets/no_data_found_widget.dart';
import 'package:craft_ai/views/language_detail_edit_screen/language_detail_edit_screen.dart';
import 'package:craft_ai/views/language_detail_screen/widgets/language_detail_floating_btn.dart';
import 'package:craft_ai/views/language_detail_screen/widgets/language_detail_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LanguageDetailScreen extends ConsumerWidget {
  final String title;
  final List<Language> languages;
  const LanguageDetailScreen({
    super.key,
    required this.title,
    required this.languages,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(profileStreamProvider);
    return state.when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Center(
            child:
                data.languages.isEmpty
                    ? NoDataFoundWidget(errorMessage: 'No Language Found')
                    : LanguageDetailList(languages: data.languages),
          ),
          floatingActionButton:
              data.languages.isEmpty
                  ? LanguageDetailFloatingBtn(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder:
                              (context) => LanguageDetailEditScreen(
                                languages: languages,
                              ),
                        ),
                      );
                    },
                  )
                  : null,
        );
      },
      error: (error, stackTrace) {
        return SizedBox();
      },
      loading: () {
        return Center(
          child: LoadingAnimationWidget.threeRotatingDots(
            color: Theme.of(context).colorScheme.primary,
            size: 25,
          ),
        );
      },
    );
  }
}
