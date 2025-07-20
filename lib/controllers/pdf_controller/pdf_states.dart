// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:craft_ai/models/custom_pdf.dart';

class PdfState {}

class PdfInitialState extends PdfState{}
class PdfLoadingstate extends PdfState{}
class PdfLoadedState extends PdfState {
  final List<CustomPdf> pdfs;
  PdfLoadedState({
    required this.pdfs,
  });
}
class PdfErrorState extends PdfState {
  final String message;
  PdfErrorState({
    required this.message,
  });
}
