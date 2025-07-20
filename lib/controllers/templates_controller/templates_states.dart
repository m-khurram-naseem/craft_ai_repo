// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:craft_ai/models/template.dart';

class TemplatesState {}

class TemplateInitialState extends TemplatesState {}

class TemplateLoadingState extends TemplatesState {}

class TemplateLoadedState extends TemplatesState {
  final List<Template> templates;
  TemplateLoadedState({
    required this.templates,
  });
}

class TemplateErrorState extends TemplatesState {}