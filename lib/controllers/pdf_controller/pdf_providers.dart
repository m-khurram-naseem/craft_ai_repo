
import 'package:craft_ai/controllers/pdf_controller/pdf_state_notifier.dart';
import 'package:craft_ai/controllers/pdf_controller/pdf_states.dart';
import 'package:craft_ai/services/pdf_service/pdf_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pdfStateProvider = StateNotifierProvider<PdfStateNotifier,PdfState>((ref){
  return PdfStateNotifier();
});


final pdfServiceProvider = Provider<PdfService>((ref) => PdfService(),);