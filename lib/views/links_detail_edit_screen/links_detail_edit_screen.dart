import 'package:craft_ai/views/links_detail_edit_screen/widgets/link_detail_edit_field.dart';
import 'package:craft_ai/views/links_detail_edit_screen/widgets/link_detail_fluency_field.dart';
import 'package:craft_ai/views/links_detail_edit_screen/widgets/link_detail_save_btn.dart';
import 'package:craft_ai/views/links_detail_edit_screen/widgets/link_detail_text.dart';
import 'package:flutter/material.dart';

class LinksDetailEditScreen extends StatelessWidget {
  final bool isUpdate;
  const LinksDetailEditScreen({super.key, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUpdate ? 'Update Link' : 'Add Link',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                LinkDetailText(text: 'Platform'),
                LinkDetailFluencyField(),
                LinkDetailText(text: 'Link'),
                LinkDetailEditField(),
              ],
            ),
            LinkDetailSaveBtn(),
          ],
        ),
      ),
    );
  }
}
