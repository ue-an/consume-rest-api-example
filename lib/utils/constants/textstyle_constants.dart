import 'package:flutter/material.dart';

const bigTitle = TextStyle(
  fontSize: 18,
);
const bigSubTitle = TextStyle(
  fontSize: 12,
  color: Colors.grey,
);
const smallTitle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
);
const smallSubTitle = TextStyle(
  fontSize: 9,
  color: Colors.grey,
);
const smallQuotation = TextStyle(
  fontStyle: FontStyle.italic,
);

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension TitleCaseExt on String {
  String toTitleCase() {
    final List<String> words = split(' ');
    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);

        return '$firstLetter$remainingLetters';
      }
      return '';
    });
    return capitalizedWords.join(' ');
  }
}
