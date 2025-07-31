import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class FillQuiz extends StatefulWidget
{
  final title;
  final name;
  const FillQuiz({super.key, required this.title,required this.name});
  @override
  State<FillQuiz> createState()=> _FillQuizState();
}

class _FillQuizState extends State<FillQuiz>
{
  void fetchQues()async{
    final res=await http.get(Uri.parse('http://10.0.2.2:8000/quiz/fetch-ques?title=${widget.title}'),
      headers: {'Content-Type':'application/json'}
    );
    print(res.body);
  }
  @override
  void initState(){
    super.initState();
    fetchQues();
  }
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(40),
        child: Column(children: [
          Text(widget.name),
          Text(widget.title),
          Text("this is fill quiz page")
        ]),
      ),
    );
  }
}