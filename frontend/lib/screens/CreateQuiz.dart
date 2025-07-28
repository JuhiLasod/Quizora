import 'package:flutter/material.dart';

class CreateQuiz extends StatefulWidget{
  @override 
  const CreateQuiz({super.key});
  State<CreateQuiz> createState()=> _createQuizState();
}

class _createQuizState extends State<CreateQuiz>
{
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      body: Text("this is create quiz page")
    );
  }
}