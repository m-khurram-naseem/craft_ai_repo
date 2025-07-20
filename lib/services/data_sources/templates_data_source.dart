import 'package:craft_ai/models/template.dart';

abstract class TemplatesDataSource {
  Future<List<Template>> fetchTemplates(int type);
}