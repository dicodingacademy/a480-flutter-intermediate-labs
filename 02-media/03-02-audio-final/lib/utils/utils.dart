durationToTimeString(Duration value) {
  final minute = value.inMinutes % 60;
  final second = value.inSeconds % 60;

  final minuteString = minute.toString().padLeft(2, '0');
  final secondString = second.toString().padLeft(2, '0');

  return "$minuteString:$secondString";
}
