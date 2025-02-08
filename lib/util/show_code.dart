import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

late final Highlighter dartLightHighlighter;
late final Highlighter dartDarkHighlighter;

Future<void> showCodeInit() async {
  await Highlighter.initialize([
    'dart',
    'yaml',
    'sql',
    'serverpod_protocol',
    'json',
  ]);
  var lightTheme = await HighlighterTheme.loadLightTheme();
  var darkTheme = await HighlighterTheme.loadDarkTheme();
  dartLightHighlighter = Highlighter(
    language: 'dart',
    theme: lightTheme,
  );
  dartDarkHighlighter = Highlighter(
    language: 'dart',
    theme: darkTheme,
  );
}

Widget getShowCode({
  required String code,
  bool isDarkMode = true,
  String language = 'dart',
}) {
  TextSpan? _code;
  switch (language) {
    default:
      _code = isDarkMode
          ? dartDarkHighlighter.highlight(code)
          : dartLightHighlighter.highlight(code);
      break;
  }

  return Container(
    padding: const EdgeInsets.all(16),
    color: isDarkMode ? Colors.black : Colors.white,
    child: Text.rich(
      _code,
      style: GoogleFonts.jetBrainsMono(
        fontSize: 14,
        height: 1.3,
      ),
    ),
  );
}
