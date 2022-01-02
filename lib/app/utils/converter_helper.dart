import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/class_model.dart';
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


}