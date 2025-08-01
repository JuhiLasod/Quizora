import 'package:flutter/material.dart';
import 'FillQuiz.dart';

class StartQuiz extends StatefulWidget{
  final title;
  const StartQuiz({super.key, required this.title});
  State<StartQuiz> createState()=> _StartQuizState();
}

class _StartQuizState extends State<StartQuiz>
{
  String name='';
  TextEditingController namec=TextEditingController();
  @override
  
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(40),
        child: Column(children:[
           Text(widget.title),
           Text("enter your name"),
           TextField(
            controller: namec,
            onChanged: (value) {
              setState(() {
                name= value;
                print('okayyy');
              });
            },
          ),
           ElevatedButton(
            onPressed: (){
              print("name");
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FillQuiz(title: widget.title,name: name)));
            }, 
            child: Text("start now"))
        ]),
      )
    );
  }
}