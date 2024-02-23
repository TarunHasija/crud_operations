import 'package:flutter/material.dart';

class inputBox extends StatelessWidget {
  TextEditingController controller;
  String name;
  inputBox({super.key,required this.name,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 330.0,
      height: 60.0,
      child:TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: name,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            
          )
          
        ),
      
      ) ,
    );
  }
}
