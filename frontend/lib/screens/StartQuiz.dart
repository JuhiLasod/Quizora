import 'package:flutter/material.dart';

class StartQuiz extends StatefulWidget{
  const StartQuiz({super.key});
  State<StartQuiz> createState()=> _StartQuizState();
}

class _StartQuizState extends State<StartQuiz>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Text("start quiz page"),
    );
  }
}