import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewScreen extends StatelessWidget {
  final File file;
  const PdfViewScreen({super.key , required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          appBar: AppBar(title: Text('PDF')),
                          body: Container(
                            color: Theme.of(context).colorScheme.secondary,
                            child: SizedBox.expand(
                              child: SfPdfViewerTheme(
                                data: SfPdfViewerThemeData(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                child: SfPdfViewer.file(
                                  file,
                                  initialZoomLevel: 1,
                                ),
                              ),
                            ),
                          ),
                        );
  }
}