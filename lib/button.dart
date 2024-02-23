// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class buttonn extends StatelessWidget {
VoidCallback onpress;
String buttonText;
Color color;


  buttonn({
    Key? key,
    required this.onpress,
    required this.buttonText,
    required this.color,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onpress, child: Text(buttonText,style: TextStyle(fontSize: 15,color: Colors.black87),),
  
    style: ElevatedButton.styleFrom(primary: color,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))));
  }
}
