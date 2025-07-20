import 'dart:io';

import 'package:craft_ai/models/custom_pdf.dart';
import 'package:craft_ai/models/template.dart';
import 'package:craft_ai/views/pdf_view_screen/pdf_view_screen.dart';
import 'package:craft_ai/views/resume_customization_screen/resume_customization_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path/path.dart' as p;

class HomeScreenListTile extends StatelessWidget {
  final CustomPdf pdf;
  const HomeScreenListTile({super.key, required this.pdf});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => PdfViewScreen(file: pdf.file),
          ),
        );
      },
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(15),
        shadowColor: Theme.of(context).colorScheme.primary,
        child: Builder(
          builder: (context) {
            if (pdf.thumbnailBytes != null) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(2.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15),
                                  bottom: Radius.circular(15),
                                ),
                                child: Image.memory(
                                  pdf.thumbnailBytes!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  CupertinoPageRoute(
                                    builder:
                                        (context) => ResumeCustomizationScreen(
                                          template: Template(
                                            html: pdf.templateHtml,
                                            imageUrl: '',
                                            type: 1,
                                          ),
                                        ),
                                  ),
                                );
                              },
                              child: HomeScreenListTileIconWidget(
                                iconData: Icons.edit_outlined,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                SharePlus.instance.share(
                                  ShareParams(
                                    text: 'Generated from Craft AI',
                                    files: [XFile(pdf.file.path)],
                                  ),
                                );
                              },
                              child: HomeScreenListTileIconWidget(
                                iconData: Icons.share_outlined,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: constraints.maxHeight * 0.2,
                            width: double.infinity,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSecondary.withAlpha(150),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      children: [
                                        Spacer(flex: 5),
                                        Expanded(
                                          flex: 90,
                                          child: LayoutBuilder(
                                            builder: (context, constraints) {
                                              return Text(
                                                p.basename(pdf.file.path),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color:
                                                      Theme.of(
                                                        context,
                                                      ).colorScheme.primary,
                                                  fontFamily: "Urbanist",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      constraints.maxHeight *
                                                      0.7,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Spacer(flex: 5),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Spacer(flex: 5),
                                      Expanded(
                                        flex: 90,
                                        child: LayoutBuilder(
                                          builder: (context, constraints) {
                                            return Text(
                                              '${pdf.pageCount.toString()} ${pdf.pageCount == 1 ? 'Page' : 'Pages'} • ${formatFileSize(getPdfFileSizeInBytes(pdf.file.path))}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                    .withAlpha(150),
                                                fontSize:
                                                    constraints.maxHeight * 0.6,
                                                fontFamily: "Urbanist",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Spacer(flex: 5),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(pdf.file.path),
              );
            }
          },
        ),
      ),
    );
  }

  int getPdfFileSizeInBytes(String filePath) {
    final file = File(filePath);
    return file.lengthSync();
  }

  // To convert to KB or MB
  String formatFileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }
}

class HomeScreenListTileIconWidget extends StatelessWidget {
  final IconData iconData;
  const HomeScreenListTileIconWidget({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary.withAlpha(150),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(iconData, color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
