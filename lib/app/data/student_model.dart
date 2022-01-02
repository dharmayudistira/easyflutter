class StudentModel {
  StudentModel({
    this.studentId,
    this.studentName,
    this.password,
    this.lecturerId,
    this.lecturerName,
    this.classId,
    this.className,
    this.status,
  });

  String? studentId;
  String? studentName;
  String? password;
  String? lecturerId;
  String? lecturerName;
  String? classId;
  String? className;
  bool? status;

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    studentId: json["id_mahasiswa"],
    studentName: json["nama_mahasiswa"],
    password: json["password"],
    lecturerId: json["id_dosen"],
    lecturerName: json["nama_dosen"],
    classId: json["id_kelas"],
    className: json["nama_kelas"],
    status: json["status"],
  );
}
