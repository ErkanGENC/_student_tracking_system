import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_1/student/student.dart';
import 'package:flutter_1/validation/student_validator.dart';

var formKey = GlobalKey<FormState>();
var students = student("", "", 0);

class StudentEdit extends StatefulWidget {
  final student selectedStudents;

  StudentEdit(this.selectedStudents);

  @override
  State<StudentEdit> createState() => _StudentAddState(selectedStudents);
}

class _StudentAddState extends State<StudentEdit> with StudentValidatorMixin {
  student selectedStudents;

  _StudentAddState(this.selectedStudents);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanici güncelleme sayfasi"),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      initialValue: selectedStudents.firstName,
      decoration: InputDecoration(
          labelText: "Kullanici adi", hintText: "example; ERKAN"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "lütfen adi girin.";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null || value!.isNotEmpty) {
          selectedStudents.firstName = value;
        }
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudents.lastName,
      decoration: InputDecoration(
          labelText: "Kullanici Soyadi", hintText: "example; GENC"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "lütfen soyadi girin.";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) {
          selectedStudents.lastName = value;
        }
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudents.grade.toString(),
      decoration: InputDecoration(labelText: "Notu", hintText: "example; 65"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "lütfen 0-100 arasinda girin.";
        }
        int grade = int.parse(value);
        if (grade < 0 || grade > 100) {
          return "notun 0-100 arasinda olmalidir.";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          selectedStudents.grade = int.parse(value);
        }
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        var formdata = formKey.currentState;
        if (formdata != null && formdata.validate()) {
          formdata.save();

          Navigator.pop(context);
        }
      },
      child: Text("Güncelle"),
    );
  }

  void saveStudent() {
    print(students.firstName);
    print(students.lastName);
    print(students.grade);
  }
}
