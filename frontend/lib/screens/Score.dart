import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';

class Score extends StatefulWidget
{
  final dynamic score;
  final dynamic title;
  final dynamic total;
  const Score({super.key ,required this.title ,required this.score, required this.total});
  @override
  State<Score> createState()=> _ScoreState();
}

class _ScoreState extends State<Score>
{
  
  void totalScore ()async{
    final res= await http.post(Uri.parse("https://quizora-nces.onrender.com/quiz/fetch-total"),
      headers: {'Content;Type': 'application/json'},
      body: jsonEncode({'title': widget.title})
    );
    print(res.body);
  }
  @override 
  void initState()
  {
    super.initState();
    totalScore();
  }
  Widget build (BuildContext context)
  {
    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 255, 221),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 250, 255, 221),
          title: Container(
            width: screenWidth *0.9, height: screenHeight*0.45,
            child: Row(children: [
              Text("Quizora",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 28, 91, 46),fontSize: 45, fontFamily: 'title'),),
              Spacer(),
              GestureDetector(onTap: (){}, child: Image.asset("assets/images/logo.png",width: screenWidth *0.15,))
            ]),
          ),
          
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [Container(
              height: screenWidth * 0.3,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(border: Border.all(width: 3,color: Color.fromARGB(255, 28, 91, 46),), borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight * 0.01),child: Text("Your Score", style: TextStyle(color: Color.fromARGB(255, 28, 91, 46),fontFamily: 'basic', fontSize: 20),)),
                    Text("You scored ${widget.score.toString()} out of ${widget.total}"),
                  ]
                ),
              )
            ),
            Padding(padding: EdgeInsets.fromLTRB(0,screenHeight * 0.01, 0, screenHeight * 0.01),
                    child: Container(
                      width : screenWidth * 0.9,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),backgroundColor: Color.fromARGB(255, 28, 91, 46),),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));

                        },
                        child:Text("Back to home", style: TextStyle(color: const Color.fromARGB(255, 250, 255, 221),fontFamily: 'basic', fontSize: 20))
                      ),
                    ),
                  ),
          ]),
        )
    );
  }
}