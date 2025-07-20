import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_ai/models/template.dart';
import 'package:craft_ai/services/data_sources/templates_data_source.dart';

class TemplatesDataSourceImpl extends TemplatesDataSource {
  CollectionReference<Map<String, dynamic>> firestore = FirebaseFirestore
      .instance
      .collection('Templates');
  @override
  Future<List<Template>> fetchTemplates(int type) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot;
    if (type == 0) {
      querySnapshot = await firestore.get();
    } else {
      querySnapshot =
          await firestore.where(Template.typeKey, isEqualTo: type).get();
    }
    return querySnapshot.docs.map((e) => Template.fromMap(e.data())).toList();
  }
}
