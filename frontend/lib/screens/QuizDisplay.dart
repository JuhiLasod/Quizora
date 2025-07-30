import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'StartQuiz.dart';

class QuizDisplay extends StatefulWidget{
  const QuizDisplay({super.key});
  // @override
  State<QuizDisplay> createState()=> _QuizDisplayState();
}

class _QuizDisplayState extends State<QuizDisplay>
{
  List<String> quizes=[];
  void fetchQuizes()async{
    
    final res=await http.get(Uri.parse('http://10.0.2.2:8000/quiz/fetch-quizes'),
      headers: {'Content-Type': 'application/json'},
      
    );
    if (res.statusCode == 200) {
  final data = jsonDecode(res.body); // This is a Map
  setState(() {
    quizes = List<String>.from(data['titles']);
  });
  
  print(quizes);
} else {
  print('Failed to fetch quizzes');
}

  }
  @override 
  void initState()
  {
    fetchQuizes();
  }
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView.builder(
        itemCount: quizes.length,
        itemBuilder: (context, index) => 
          ListTile(
            title: GestureDetector(
              onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=> StartQuiz()));},
              child: Text(quizes[index])
            ),
          )
        )
    );
  }
}