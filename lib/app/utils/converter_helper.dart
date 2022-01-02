import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/class_model.dart';
import 'package:easyflutter/app/data/exercise_model.dart';
import 'package:easyflutter/app/data/log_model.dart';
import 'package:easyflutter/app/data/student_model.dart';
import 'package:flutter/material.dart';

class ConverterHelper {

  static List<ClassModel> mapClassFirestoreToClassModel(AsyncSnapshot<QuerySnapshot> snapshots) {
    List<ClassModel> allClass = [];

    snapshots.data!.docs.forEach((element) {
      Map<String,dynamic> data = element.data() as Map<String, dynamic>;
      var convertedClassModel = ClassModel.fromJson(data);
      allClass.add(convertedClassModel);
    });

    return allClass;
  }

  static List<StudentModel> mapStudentFirestoreToStudentModel(AsyncSnapshot<QuerySnapshot> snapshots) {
    List<StudentModel> allStudent = [];

    snapshots.data!.docs.forEach((element) {
      Map<String,dynamic> data = element.data() as Map<String, dynamic>;
      var convertedStudentModel = StudentModel.fromJson(data);
      allStudent.add(convertedStudentModel);
    });

    return allStudent;
  }

  static List<ExerciseModel> mapExerciseFirestoreToExerciseModel(AsyncSnapshot<QuerySnapshot> snapshots) {
    List<ExerciseModel> allExercise = [];

    snapshots.data!.docs.forEach((element) {
      Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      var convertedExerciseModel = ExerciseModel.fromJson(data);
      allExercise.add(convertedExerciseModel);
    });

    return allExercise;
  }

  static List<ExerciseModel> mapExerciseFirestoreToExerciseModelByType(AsyncSnapshot<QuerySnapshot> snapshots, String type) {
    List<ExerciseModel> allExercise = [];

    snapshots.data!.docs.forEach((element) {
      Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      var convertedExerciseModel = ExerciseModel.fromJson(data);

      if(convertedExerciseModel.type == type) {
        allExercise.add(convertedExerciseModel);
      }
    });

    return allExercise;
  }

  static List<LogModel> mapLogFirestoreToLogModel(AsyncSnapshot<QuerySnapshot> snapshots) {
    List<LogModel> logs = [];

    snapshots.data!.docs.forEach((element) {
      Map<String, dynamic> data = element.data() as Map<String, dynamic>;
      var convertedLogModel = LogModel.fromJson(data);
      logs.add(convertedLogModel);
    });

    return logs;
  }

}