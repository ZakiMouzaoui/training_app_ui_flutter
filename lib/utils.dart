Duration parseDurationFromDouble(double value){
  int seconds = value.toInt();
  int minutes = (value - seconds) ~/ 60;
  return Duration(minutes: minutes, seconds: seconds);
}
