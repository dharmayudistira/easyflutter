class ExerciseModel {
  ExerciseModel({
    this.exerciseId,
    this.exerciseName,
    this.classId,
    this.type,
  });


  String? exerciseId;
  String? exerciseName;
  String? classId;
  String? type;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
    exerciseId: json["id_latihan"],
    exerciseName: json["nama_latihan"],
    classId: json["id_kelas"],
    type: json["tipe"],
  );
}