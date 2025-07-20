
import 'dart:typed_data';
import 'dart:ui';

import 'package:craft_ai/models/custom_pdf.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:sqflite/sqflite.dart';

class PdfService {
  static const version = 1;
  late Database db;
  static PdfService? instance;

  PdfService._();

  factory PdfService(){
    return instance ??= PdfService._();
  }

  init() async {
    var dbPath = await getDatabasesPath();
    db = await openDatabase(
      join(dbPath, 'pdf.db'),
      version: version,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE ${CustomPdf.tableName} (id INTEGER PRIMARY KEY, ${CustomPdf.filePathKey} TEXT, ${CustomPdf.templateHtmlKey} TEXT, ${CustomPdf.thumbnailBytesKey} BLOB, ${CustomPdf.pageCountKey} INTEGER)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion != newVersion) {
          db.delete(CustomPdf.tableName);
          db.execute(
            'CREATE TABLE ${CustomPdf.tableName} (id INTEGER PRIMARY KEY, ${CustomPdf.filePathKey} TEXT, ${CustomPdf.templateHtmlKey} TEXT, ${CustomPdf.thumbnailBytesKey} BLOB, ${CustomPdf.pageCountKey} INTEGER)',
          );
        }
      },
    );
  }

  Future<List<CustomPdf>> getAllPdf() async{
    var result = await db.rawQuery('SELECT * FROM ${CustomPdf.tableName}');
    return result.map((e) => CustomPdf.fromMap(e),).toList();
  }

  Future<bool> savePdf(
    String editedHtml,
    String templateHtml,        
    String pdfName,
    
  ) async {
    var direcotry = await getApplicationDocumentsDirectory();
    var file = await FlutterHtmlToPdf.convertFromHtmlContent(
      editedHtml,
      direcotry.path,
      pdfName,
    );
    var thumbnailData = await generatePdfThumbnail(file.path);
    var pdf = CustomPdf(
      file: file,
      templateHtml: templateHtml,
      thumbnailBytes: thumbnailData.$1,
      pageCount: thumbnailData.$2,
    );
    int noOfRowsAffected = await db.insert(CustomPdf.tableName, pdf.toMap());
    return noOfRowsAffected >= 0;
  }

  
  Future<(Uint8List?, int)> generatePdfThumbnail(
    String pdfPath,    
  ) async {
    final document = await PdfDocument.openFile(pdfPath);
    int count = document.pagesCount;
    final page = await document.getPage(1);
    final pageImage = await page.render(
       width: 750, // Thumbnail width
      height: 850, // Thumbnail height// Thumbnail height
      format: PdfPageImageFormat.png,
      backgroundColor: '#FFFFFF',
      cropRect: Rect.fromLTWH(0, 0, 750, 850),
    );
    await page.close();
    if (pageImage != null) {
      return (pageImage.bytes, count);
    }
    return (null, count);
  }
}
