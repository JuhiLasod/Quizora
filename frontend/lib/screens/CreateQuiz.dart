import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateQuiz extends StatefulWidget{
  @override 
  const CreateQuiz({super.key});
  State<CreateQuiz> createState()=> _createQuizState();
}

class _createQuizState extends State<CreateQuiz>
{
  bool showWidget=false;
  String title="";
  String ques="";
  String op1="";
  String op2="";
  String op3="";
  String op4="";
  String ans="";
  TextEditingController _titlec=new TextEditingController();
  TextEditingController _quesc=new TextEditingController();
  TextEditingController _op1c=new TextEditingController();
  TextEditingController _op2c=new TextEditingController();
  TextEditingController _op3c=new TextEditingController();
  TextEditingController _op4c=new TextEditingController();
  TextEditingController _ansc=new TextEditingController();
  List<Map<String,dynamic>> questions=[];

  void setQues() {
  Map<String, dynamic> quesObj = {
    "ques": ques,
    "options": [op1, op2, op3, op4],
    "ans": ans
  };
  setState(() {
    questions.add(quesObj);
  });
}
  void setQuiz()async{
    print(questions);

    final res=await http.post(Uri.parse('http://10.0.2.2:8000/quiz/set-quiz'),
      headers: {'Content-type':'application/json'},
      body:json.encode({
        'title':title,
        'Questions':questions
      })
    );
    print("sent");
    print(res.body);
    setState(() {
      // title="";
      ques="";
      op1="";
      op2="";
      op3="";
      op4="";
      ans="";
    });
  }
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      body: Padding(padding:EdgeInsets.all(40),
        child: Column(
          children:[ 
            ElevatedButton(onPressed: (){setQuiz();}, child: Text("set quiz")),
            Padding(padding:EdgeInsets.all(40),child: ElevatedButton(onPressed: (){setState(() {
            showWidget=true;
          });}, 
          child: Text("add ques"))
          ),
          TextField(
              controller: _titlec,
              onChanged: (value){setState(() {
                title=value;
                });
              },
            ),
          if(showWidget)quesFormat()
        ]),
      )
    );
  }
  Widget quesFormat(){
    return Padding(padding: EdgeInsets.all(30),
        child: Column(children: [
          // TextField(
          //   controller: _titlec,
          //   onChanged: (value){setState(() {
          //     title=value;
          //     });
          //   },
          // ),
          TextField(
            controller: _quesc,
            onChanged: (value){setState(() {
              ques=value;
              });
            },
          ),
          TextField(
            controller: _op1c,
            onChanged: (value){setState(() {
              op1=value;
              });
            },
          ),
          TextField(
            controller: _op2c,
            onChanged: (value){setState(() {
              op2=value;
              });
            },
          ),
          TextField(
            controller: _op3c,
            onChanged: (value){setState(() {
              op3=value;
              });
            },
          ),
          TextField(
            controller: _op4c,
            onChanged: (value){setState(() {
              op4=value;
              });
            },
          ),
          TextField(
            controller: _ansc,
            onChanged: (value){setState(() {
              ans=value;
              });
            },
          ),
          
          ElevatedButton(onPressed: (){setQues();_quesc.clear(); _op1c.clear(); _op2c.clear();
    _op3c.clear(); _op4c.clear(); _ansc.clear();}, child: Text("set ques"))
        ],)
      
    );
  }
}