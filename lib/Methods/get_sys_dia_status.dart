import 'package:bptracker/models/bp_status.dart';
import 'package:bptracker/utils/colors.dart';

BPStatus getSysDiaStatus(sys, dia) {
  List<BPStatus> bpStatus = [
    BPStatus(
        label: "Normal Blood Pressure",
        color: AppColors.normal,
        msg: "SYS < 120 and DIA < 80"),
    BPStatus(
        label: "Elevated Blood Pressure",
        color: AppColors.elevated,
        msg: "SYS < 120-129 and DIA < 80"),
    BPStatus(
        label: "High Blood Pressure - Stage 1",
        color: AppColors.hts1,
        msg: "SYS < 130-139 and DIA < 80-89"),
    BPStatus(
        label: "High Blood Pressure - Stage 2",
        color: AppColors.hts2,
        msg: "SYS > 140-129 and DIA > 90"),
    BPStatus(
        label: "High Blood Pressure - Stage 3",
        color: AppColors.hts3,
        msg: "SYS > 180 and/or DIA > 120"),
  ];

  if (sys <= 120 && dia <= 80) {
    return bpStatus[0];
  } else if (sys <= 129 && dia <= 80) {
    return bpStatus[1];
  } else if (sys <= 140 && dia <= 90) {
    return bpStatus[2];
  } else if (sys <= 180 && dia <= 120) {
    return bpStatus[3];
  } else if (sys <= 190 && dia <= 180) {
    return bpStatus[4];
  } else {
    return bpStatus[0];
  }
}
