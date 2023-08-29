extension StringExtension on String {
  String formattedName() {
    final words = split('-');
    final formattedWords = words.map((word) => word.capitalize()).toList();
    return formattedWords.join(' ');
  }

  String capitalize() {
    return this[0].toUpperCase() + substring(1);
  }
}
