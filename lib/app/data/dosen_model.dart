class LecturerModel {
  LecturerModel({
    this.lecturerId,
    this.lecturerPassword,
    this.lecturerName,
  });

  String? lecturerId;
  String? lecturerPassword;
  String? lecturerName;

  factory LecturerModel.fromJson(Map<String, dynamic> json) => LecturerModel(
    lecturerId: json["id_dosen"],
    lecturerPassword: json["kata_sandi"],
    lecturerName: json["nama_dosen"],
  );
}