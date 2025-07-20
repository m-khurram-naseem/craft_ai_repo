import 'package:craft_ai/models/user_data.dart';
import 'package:craft_ai/utils/template_utils/extensions.dart';

class TemplateCustomizationUtil {
  static String populateHtmlWithData(UserData userData, String html) {
    userData.toHtmlUsableFormat().forEach((key, value) {
      if (value is String) {
        html = html.replaceAll('{{$key}}', value);
      } else if (value is List) {
        html = _populateRepeatingSection(
          html,
          '<!-- ${key}Start -->',
          '<!-- ${key}End -->',
          value.map((e) => e as Map<String , String>,).toList(),
        );
      }
    });
    return html;
  }

  static String _populateRepeatingSection(
    String html,
    String startTag,
    String endTag,
    List<Map<String, String>> dataList,
  ) {
    final startIndex = html.indexOf(startTag);
    final endIndex = html.indexOf(endTag) + endTag.length;
    if (startIndex == -1 || endIndex == -1) return html;

    final templateBlock = html.substring(
      html.indexOf(startTag) + startTag.length,
      html.indexOf(endTag),
    );

    final generatedBlocks = dataList
        .map((data) {
          String block = templateBlock;
          data.forEach((key, value) {
            block = block.replaceAll('{{$key}}', value.toString());
          });
          return block;
        })
        .join('\n');

    return html.replaceRange(startIndex, endIndex, generatedBlocks);
  }
}
