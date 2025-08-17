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
  bool loading=true;
  List<String> quizes=[];
  void fetchQuizes()async{
    
    final res=await http.get(Uri.parse('https://quizora-nces.onrender.com/quiz/fetch-quizes'),
      headers: {'Content-Type': 'application/json'},
      
    );
    if (res.statusCode == 200) {
  final data = jsonDecode(res.body); // This is a Map
  setState(() {
    quizes = List<String>.from(data['titles']);
    loading=false;
  });
  
  print(quizes);
} else {
  print('Failed to fetch quizzes');
}

  }
  @override 
  void initState()
  {
    super.initState();
    fetchQuizes();
  }
  Widget build(BuildContext context){
    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 250, 255, 221),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 250, 255, 221),
          title: Container(
            width: screenWidth *0.9, height: screenHeight*0.45,
          // color: const Color.fromARGB(255, 240, 250, 183),
            child: Row(children: [
              Text("Available Quizes",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 28, 91, 46),fontSize: 45, fontFamily: 'title'),),
              Spacer(),
              GestureDetector(onTap: (){}, child: Image.asset("assets/images/logo.png",width: screenWidth *0.15,))
            ]),
          ),
          
        ),
      body: loading ? Center(child: CircularProgressIndicator()): ListView.builder(
        itemCount: quizes.length,
        itemBuilder: (context, index) => 
          ListTile(
            title: GestureDetector(
              onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=> StartQuiz(title: quizes[index])));},
              child: Container(
                height: screenHeight *0.08,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Color.fromARGB(255, 216, 248, 225),border: Border.all(color: Color.fromARGB(255, 2, 49, 15), )),
                child:Center(child: Text(quizes[index] , style: TextStyle(fontFamily: 'basic', fontSize: 20),))
              )
            ),
          )
        )
    );
  }
}