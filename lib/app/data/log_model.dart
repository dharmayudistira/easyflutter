class LogModel {
  LogModel({
    this.logId,
    this.studentId,
    this.studentName,
    this.exerciseId,
    this.step,
    this.time,
    this.answer,
  });

  String? logId;
  String? studentId;
  String? studentName;
  String? exerciseId;
  String? step;
  String? time;
  String? answer;

  factory LogModel.fromJson(Map<String, dynamic> json) => LogModel(
    logId: json["id_log"],
    studentId: json["id_mahasiswa"],
    studentName: json["nama_mahasiswa"],
    exerciseId: json["id_latihan"],
    step: json["langkah"],
    time: json["waktu"],
    answer: json["jawaban"],
  );
}
