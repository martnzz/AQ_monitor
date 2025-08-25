String formatDate(String item) {
  String dateString = item;

  List<String> parts = dateString.split('T');
  String datePart = parts[0];
  String timePart = parts[1].split('.')[0];
  String formattedDate = '$datePart $timePart';
  return formattedDate;
}

String getHour(String item) {
  String dateString = item;
  List<String> parts = dateString.split('T');
  String timePart = parts[1].split(':')[0];
  return timePart;
}
