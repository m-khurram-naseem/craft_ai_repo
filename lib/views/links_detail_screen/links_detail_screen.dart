import 'package:craft_ai/controllers/profile_controller/profile_providers.dart';
import 'package:craft_ai/models/link.dart';
import 'package:craft_ai/utils/comman_widgets/no_data_found_widget.dart';
import 'package:craft_ai/views/links_detail_edit_screen/links_detail_edit_screen.dart';
import 'package:craft_ai/views/links_detail_screen/widgets/links_detail_add_btn.dart';
import 'package:craft_ai/views/links_detail_screen/widgets/links_detail_floating_btn.dart';
import 'package:craft_ai/views/links_detail_screen/widgets/links_detail_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LinksDetailScreen extends ConsumerWidget {
  final String title;
  final List<Link> links;
  const LinksDetailScreen({
    super.key,
    required this.title,
    required this.links,
  });

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    var state = ref.watch(profileStreamProvider);
    return state.when(data: (data) {
      return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child:
            data.links.isEmpty
                ? NoDataFoundWidget(errorMessage: 'No Links Found')
                : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    LinksDetailList(links: data.links,),
                    LinksDetailAddBtn(
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder:
                                (context) =>
                                    LinksDetailEditScreen(links: data.links),
                          ),
                        );
                      },
                    ),
                  ],
                ),
      ),
      floatingActionButton:
          data.links.isEmpty
              ? LinksDetailFloatingBtn(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => LinksDetailEditScreen(links: data.links),
                    ),
                  );
                },
              )
              : null,
    );      
    },loading: () {
      return Center(
                  child: LoadingAnimationWidget.threeRotatingDots(
                    color: Theme.of(context).colorScheme.primary,
                    size: 25,
                  ),
                );
    },error: (error, stackTrace) {
      return SizedBox();
    },);
    
  }
}
