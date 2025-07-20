import 'dart:io';
import 'dart:typed_data';

class CustomPdf {
  static const tableName = 'Pdf',
      filePathKey = 'filePath',
      templateHtmlKey = 'templateHtml',
      thumbnailBytesKey = 'thumbnailBytes',
      pageCountKey = 'pageCount';

  File file;
  String templateHtml;
  Uint8List? thumbnailBytes;
  int pageCount;

  CustomPdf({
    required this.file,
    required this.templateHtml,
    required this.thumbnailBytes,
    required this.pageCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      filePathKey: file.path,
      templateHtmlKey: templateHtml,
      thumbnailBytesKey: thumbnailBytes,
      pageCountKey: pageCount,
    };
  }

  factory CustomPdf.fromMap(Map<String, dynamic> map) {
    return CustomPdf(
      file: File(map[filePathKey]),
      templateHtml: map[templateHtmlKey],
      thumbnailBytes: map[thumbnailBytesKey],
      pageCount: map[pageCountKey],
    );
  }
}
