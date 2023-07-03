import 'package:flutter/material.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Peoples Screen",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),),
    );
  }
}