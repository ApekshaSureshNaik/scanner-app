
import 'package:intl/intl.dart';

List<Map<String, dynamic>> liveEvents(List<dynamic> events) {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);

  List<Map<String, dynamic>> liveEvents = events.where((event) {
    String? startDateStr = event["start_date"];
    String? endDateStr = event["end_date"];
    if (startDateStr == null || endDateStr == null) return false;

    try {
      DateTime startDate = DateTime.parse(startDateStr);
      DateTime endDate = DateTime.parse(endDateStr);

      startDate = DateTime(startDate.year, startDate.month, startDate.day);
      endDate = DateTime(endDate.year, endDate.month, endDate.day);

      return today.isAtSameMomentAs(startDate) ||
          today.isAtSameMomentAs(endDate) ||
          (today.isAfter(startDate) && today.isBefore(endDate));
    } catch (_) {
      return false;
    }
  }).map((e) => e as Map<String, dynamic>).toList();

  // ✅ Reverse the list
  return liveEvents.reversed.toList();
}


String? extractNumberFromURL(String url) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // String urlStr =
  //   "https://crm.dev.bluerose.solutions/jaindirect#/scanner-details/249?page=membership";
  RegExp regex = RegExp(r'scanner-details/(\d+)');
  Match? match = regex.firstMatch(url);
  print(
      "match != null ? match.group(1) : null. ${match != null ? match.group(1) : null}");
  return match != null ? match.group(1) : null;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}


String extractDate(String inputString) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // give a function to extract only date from the particular string "2025-02-07 00:00:00". and return in the format dd-MM-yyyy
  // String inputString = "2025-02-07 00:00:00";
  DateTime dateTime = DateTime.parse(inputString);
  String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
  return formattedDate;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
