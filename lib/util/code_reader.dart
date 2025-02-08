import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart' show debugPrint;

class CodeReader {
  /// final code = await CodeReader.getDartCode('lib/widget/my_widget.dart');
  static Future<String> getDartCode(String path) async {
    // 将路径中的反斜杠转换为正斜杠
    final normalizedPath = path.replaceAll(r'\', '/');
    try {
      return await rootBundle.loadString(normalizedPath);
    } catch (e) {
      debugPrint('Error loading dart file: $e');
      return '文件为空或不存在';
    }
  }
}
