class PressureRecordModel {
  PressureRecordModel({
    required this.date,
    required this.dateTime,
    // required this.title,
    required this.note,
    required this.sys,
    required this.dia,
    required this.pulse,
  });
  String date;
  Map dateTime;
  // String title;
  String note;
  int sys;
  int dia;
  int pulse;
}
