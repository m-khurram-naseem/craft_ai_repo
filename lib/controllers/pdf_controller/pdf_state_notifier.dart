
import 'dart:typed_data';

import 'package:craft_ai/controllers/pdf_controller/pdf_states.dart';
import 'package:craft_ai/models/custom_pdf.dart';
import 'package:craft_ai/services/pdf_service/pdf_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdfx/pdfx.dart';
import 'package:path/path.dart' as p;

class PdfStateNotifier extends StateNotifier<PdfState> {
  List<CustomPdf> customPdfList = [];
  PdfStateNotifier() : super(PdfInitialState());

  fetchAllPdfs() async {
    try {
      state = PdfLoadingstate();
      customPdfList = await PdfService().getAllPdf();                  
      state = PdfLoadedState(pdfs: customPdfList);
    } catch (e) {
      state = PdfErrorState(message: e.toString());
    }
  }

  updateList(String value) {
    state = PdfLoadedState(
      pdfs:
          customPdfList
              .where((element) => p.basename(element.file.path).contains(value))
              .toList(),
    );
  }

  Future<(Uint8List?, int)> generatePdfThumbnail(
    String pdfPath,
    double width,
    double height,
  ) async {
    final document = await PdfDocument.openFile(pdfPath);
    int count = document.pagesCount;
    final page = await document.getPage(1);
    final pageImage = await page.render(
      width: width, // Thumbnail width
      height: height, // Thumbnail height
      format: PdfPageImageFormat.png,
      backgroundColor: '#FFFFFF',
      cropRect: Rect.fromLTWH(0, 0, width, height),
    );
    await page.close();
    if (pageImage != null) {
      return (pageImage.bytes, count);
    }
    return (null, count);
  }
}
