import 'package:craft_ai/views/tools_detail_edit_screen/widgets/tools_detail_edit_field.dart';
import 'package:craft_ai/views/tools_detail_edit_screen/widgets/tools_detail_edit_text.dart';
import 'package:craft_ai/views/tools_detail_edit_screen/widgets/tools_detail_save_btn.dart';
import 'package:flutter/material.dart';

class ToolsDetailEditScreen extends StatelessWidget {
  final bool isUpdate;
  const ToolsDetailEditScreen({super.key, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isUpdate ? 'Update Tool' : 'Add Tool',
          style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child:  Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [ToolsDetailEditText(), ToolsDetailEditField()],
            ),
            ToolsDetailSaveBtn(),
          ],
        ),
      ),
    );
  }
}
