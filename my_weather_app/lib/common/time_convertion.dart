String Time(int time) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(time * 1000);
  int hour = date.hour;
  String amPm = hour < 12 ? 'AM' : 'PM';
  if (hour > 12) {
    hour -= 12;
  } else if (hour == 0) {
    hour = 12;
  }
  String formatedTime =
      "${hour}:${date.minute.toString().padLeft(2, '0')} $amPm";
  return formatedTime;
}

String Day(int day) {
  DateTime date = DateTime.now();
  int curentday = date.weekday + day;
  String dayName = "";
  print(curentday);
  switch (curentday) {
    case 1:
      dayName = "Monday";
      break;
    case 2:
      dayName = "Tuesday";
      break;
    case 3:
      dayName = "Wednesday";
      break;
    case 4:
      dayName = "Thursday";
      break;
    case 5:
      dayName = "Friday";
      break;
    case 6:
      dayName = "Saturday";
      break;
    case 7:
      dayName = "Sunday";
      break;
    default:
      dayName = "Unknown";
      break;
  }
  return dayName;
}
