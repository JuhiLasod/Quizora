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
  
  void setQuiz()async{
    print(title);
    print(ques);
    print(op1);
    print(op2);
    print(op3);
    print(op4);
    print(ans);
    final res=await http.post(Uri.parse('http://10.0.2.2/set-quiz'),
      headers: {'Content-type':'application/json'},
      body:json.encode({
        'title':title,
        'Questions':[
          {
            'ques': ques,
            'options': [op1,op2,op3,op4],
            'ans':ans
          }
        ]
        })
    );
    print(res.body);
  }
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(30),
        child: Column(children: [
          TextField(
            controller: _titlec,
            onChanged: (value){setState(() {
              title=value;
              });
            },
          ),
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
          
          ElevatedButton(onPressed: (){setQuiz();}, child: Text("set"))
        ],)
      )
    );
  }
}