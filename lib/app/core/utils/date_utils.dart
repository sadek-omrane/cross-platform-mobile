// date ago function
String dateAgo(String? date) {
  if (date == null) return 'longtemps';
  final DateTime dateTime = DateTime.parse(date);
  final Duration diff = DateTime.now().difference(dateTime);
  if (diff.inDays > 365) {
    return '${(diff.inDays / 365).floor()} ans';
  } else if (diff.inDays > 30) {
    return '${(diff.inDays / 30).floor()} mois';
  } else if (diff.inDays > 7) {
    return '${(diff.inDays / 7).floor()} semaines';
  } else if (diff.inDays > 0) {
    return '${diff.inDays} jours';
  } else if (diff.inHours > 0) {
    return '${diff.inHours} heures';
  } else if (diff.inMinutes > 0) {
    return '${diff.inMinutes} minutes';
  } else {
    return 'Maintenant';
  }
}
