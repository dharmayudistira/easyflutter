import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:get/get.dart';

class SendAnswerHelper {
  static final _storageHelper = Get.find<StorageHelper>();
  static final exerciseReference = FirebaseFirestore.instance.collection("latihan");
  static final studentReference = FirebaseFirestore.instance.collection("mahasiswa"); 

  static void updateExercise(String exerciseId) async {
    final exercises = await exerciseReference
        .where("id_latihan", isEqualTo: exerciseId)
        .get();

    final exercise = exercises.docs[0];
    var listStudentId = exercise['daftar_id_mahasiswa'];

    if (!listStudentId.isEmpty) {
      var isFound = false;
      listStudentId.forEach((element) {
        if (element == _storageHelper.getIdUser()) {
          isFound = true;
          return;
        }
      });

      if (!isFound) {
        listStudentId.add(_storageHelper.getIdUser());
        exerciseReference.doc(exercise.id).set({
          "daftar_id_mahasiswa": listStudentId,
        }, SetOptions(merge: true));
      }
    } else {
      listStudentId.add(_storageHelper.getIdUser());
      exerciseReference.doc(exercise.id).set({
        "daftar_id_mahasiswa": listStudentId,
      }, SetOptions(merge: true));
    }
  }

  static void updateStudent(String exerciseId) async {
    final students = await studentReference
        .where("id_mahasiswa", isEqualTo: _storageHelper.getIdUser())
        .get();

    final student = students.docs[0];
    var listExerciseId = student['daftar_id_latihan'];

    if (!listExerciseId.isEmpty) {
      var isFound = false;
      listExerciseId.forEach((element) {
        if (element == exerciseId) {
          isFound = true;
          return;
        }
      });

      if (!isFound) {
        listExerciseId.add(exerciseId);
        studentReference.doc(student.id).set({
          "daftar_id_latihan": listExerciseId,
        }, SetOptions(merge: true));
      }
    } else {
      listExerciseId.add(exerciseId);
      studentReference.doc(student.id).set({
        "daftar_id_latihan": listExerciseId,
      }, SetOptions(merge: true));
    }
  } 
}