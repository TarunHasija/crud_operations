import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operations/button.dart';
import 'package:crud_operations/inputbox.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  // final _controller = TextEditingController();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController classcontroller = TextEditingController();
  TextEditingController rollcontroller = TextEditingController();
  TextEditingController gpacontroller = TextEditingController();

  createData() {
    print("created");

    // String name = namecontroller.text;
    // String classs = classcontroller.text;
    // String roll = rollcontroller.text;
    // String gpa = gpacontroller.text;
    // CollectionReference students =
    //     FirebaseFirestore.instance.collection('students');
    // students.doc(name).set({
    //   "name": name,
    //   "class": classs,
    //   "roll": roll,
    //   "gpa": gpa,
    // }).then((value) {
    //   print("User Added");
    // }).catchError((e) {
    //   print("Error: $e");
    // });

    DocumentReference docRef = FirebaseFirestore.instance
        .collection("students")
        .doc(namecontroller.text);
    Map<String, dynamic> students = {
      "name": namecontroller.text,
      "class": classcontroller.text,
      "roll": rollcontroller.text,
      "gpa": gpacontroller.text,
    };
    docRef.set(students).whenComplete(() {
      print("Student added");
    });
    namecontroller.clear();
    classcontroller.clear();
    rollcontroller.clear();
    gpacontroller.clear();
  }

  readData() {
    print("read");
    DocumentReference students = FirebaseFirestore.instance
        .collection("students")
        .doc(namecontroller.text);

    students.get().then((value) {
      var data = value.data();
      var name = (data as Map)['name'];
      var classs = (data as Map)['class'];
      var roll = (data as Map)['roll'];
      var gpa = (data as Map)['gpa'];

      print("Name: $name");
      print("Class: $classs");
      print("Roll: $roll");
      print("GPA: $gpa");

      namecontroller.clear();
      classcontroller.clear();
      rollcontroller.clear();
      gpacontroller.clear();
    });
  }

  updateData() {
    print("update");
    DocumentReference docRef = FirebaseFirestore.instance
        .collection("students")
        .doc(namecontroller.text);
    Map<String, dynamic> students = {
      "name": namecontroller.text,
      "class": classcontroller.text,
      "roll": rollcontroller.text,
      "gpa": gpacontroller.text,
    };
    docRef.set(students).whenComplete(() {
      print("Student added");
    });
    namecontroller.clear();
    classcontroller.clear();
    rollcontroller.clear();
    gpacontroller.clear();
  }

  deleteData() {
    print("delete");
    DocumentReference students = FirebaseFirestore.instance
        .collection("students")
        .doc(namecontroller.text);
    students.delete().whenComplete(() => print("deleted"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud Operations'),
      ),
      body: Center(
        child: Column(
          children: [
            inputBox(name: "Name", controller: namecontroller),
            inputBox(name: "Class", controller: classcontroller),
            inputBox(name: "Roll No", controller: rollcontroller),
            inputBox(name: "GPA", controller: gpacontroller),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonn(
                    onpress: createData,
                    buttonText: "Create",
                    color: Colors.green,
                  ),
                  buttonn(
                    onpress: readData,
                    buttonText: "Read",
                    color: Colors.blue,
                  ),
                  buttonn(
                    onpress: updateData,
                    buttonText: "Update",
                    color: Colors.yellow,
                  ),
                  buttonn(
                    onpress: deleteData,
                    buttonText: "Delete",
                    color: Colors.red,
                  ),
                ],
              ),
              
            ),
            // StreamBuilder(stream: FirebaseFirestore.instance.collection("students").snapshots(), builder: (context,snapshot){
            //   if(snapshot.hasData){
            //     return ListView.builder(itemCount: snapshot.data?.documents.length,itemBuilder: (context,snapshot){});
            //   }
            // })
          ],
        ),
      ),
    );
  }
}
