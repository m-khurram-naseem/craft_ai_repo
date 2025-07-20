import 'package:craft_ai/controllers/templates_controller/templates_state_notifier.dart';
import 'package:craft_ai/controllers/templates_controller/templates_states.dart';
import 'package:craft_ai/services/data_sources/templates_data_source.dart';
import 'package:craft_ai/services/data_sources/templates_data_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final templatesDataSourceProvider = Provider<TemplatesDataSource>(
  (ref) => TemplatesDataSourceImpl(),
);

final templatesStateNotifierProvider =
    StateNotifierProvider<TemplatesStateNotifier, TemplatesState>((ref) {
      return TemplatesStateNotifier(
        templatesDataSource: ref.read(templatesDataSourceProvider),
      );
    });
