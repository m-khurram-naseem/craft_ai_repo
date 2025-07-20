import 'package:craft_ai/controllers/templates_controller/templates_states.dart';
import 'package:craft_ai/services/data_sources/templates_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TemplatesStateNotifier extends StateNotifier<TemplatesState>{
  final TemplatesDataSource templatesDataSource;
  int selectedChip = 0;
  TemplatesStateNotifier({required this.templatesDataSource}):super(TemplateInitialState());


  void fetchTemplates(int index) async{
    try{
      state = TemplateLoadingState();
      selectedChip = index;
      var list = await templatesDataSource.fetchTemplates(index);
      state = TemplateLoadedState(templates: list);
    }catch(e){
      state = TemplateErrorState();
          }
  }
}