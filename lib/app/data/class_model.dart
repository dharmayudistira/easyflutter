class ClassModel {
  ClassModel({
    this.lecturerId,
    this.classId,
    this.lecturerName,
    this.className,
  });

  String? lecturerId;
  String? classId;
  String? lecturerName;
  String? className;

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
    lecturerId: json["id_dosen"],
    classId: json["id_kelas"],
    lecturerName: json["nama_dosen"],
    className: json["nama_kelas"],
  );

  Map<String, dynamic> toJson() => {
    "id_dosen": lecturerId,
    "id_kelas": classId,
    "nama_dosen": lecturerName,
    "nama_kelas": className,
  };
}