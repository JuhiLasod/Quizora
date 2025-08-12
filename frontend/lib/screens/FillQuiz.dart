import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'Score.dart';

class FillQuiz extends StatefulWidget {
  final title;
  final name;
  const FillQuiz({super.key, required this.title, required this.name});

  @override
  State<FillQuiz> createState() => _FillQuizState();
}

class _FillQuizState extends State<FillQuiz> {
  Map<String, dynamic> data = {"Questions": []};
  final correctAnswers = <int, String>{};
  Map <int,String> answer={};
  Map<int, String> selectedOptions = {}; 
  int score=0;
  // List <String> asnwer=[];
  void fetchQues() async {
    print(widget.name);
    setState(() {
      score=0;
    });
    final res = await http.get(
      Uri.parse('http://10.0.2.2:8000/quiz/fetch-ques?title=${widget.title}'),
      headers: {'Content-Type': 'application/json'},
    );
    
    final decoded = json.decode(res.body);
  
  // Collect correct answers
  
  final questions = decoded['Questions'];
  for (int i = 0; i < questions.length; i++) {
    correctAnswers[i] = questions[i]['ans'];
    print(correctAnswers[i]);
  }

  setState(() {
    data = decoded;
    answer = correctAnswers;
  });
}

Future<void> scoring()async{
  score=0;
  for(int i=0;i<correctAnswers.length;i++)
  {
    if(correctAnswers[i]==selectedOptions[i])
    {
      score++;
    }
  }
  print(score);
  final res= await http.post(Uri.parse("http://10.0.2.2:8000/quiz/set-score"),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'title': widget.title, 'name': widget.name, 'score': score})
  );
  if(res.statusCode==200)
  {
    print("score added");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Score(title: widget.title, score: score)));
  }
  else
  {
    print("error in adding score");
  }
  
}

  @override
  void initState() {
    super.initState();
    print(widget.name);
    fetchQues();
  }

  @override
  Widget build(BuildContext context) {
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
              Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 28, 91, 46),fontSize: 45, fontFamily: 'title'),),
              Spacer(),
              GestureDetector(onTap: (){}, child: Image.asset("assets/images/logo.png",width: screenWidth *0.15,))
            ]),
          ),
          
        ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data['Questions'].length,
                itemBuilder: (context, index) {
                  final question = data['Questions'][index];
                  // Map <int,String> answer={};
                  final options = question['options'] ?? [];
                  // setState(() {
                  //   answer[index]= (question['ans']);
                  // });
                  return Card(
                    color: const Color.fromARGB(255, 233, 254, 221),
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Q${index + 1}: ${question['ques']}", style: TextStyle(color: const Color.fromARGB(255, 25, 94, 30),fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(height: 10),
                          ...options.map<Widget>((opt) {
                            return RadioListTile(
                              title: Text(opt),
                              value: opt,
                              groupValue: selectedOptions[index],
                              onChanged: (value) {
                                setState(() {
                                  selectedOptions[index] = value.toString();
                                });
                              },
                              activeColor: const Color.fromARGB(255, 25, 94, 30),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0,screenHeight * 0.01, 0, screenHeight * 0.01),
                    child: Container(
                      width : screenWidth * 0.8,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),backgroundColor: Color.fromARGB(255, 28, 91, 46),),
                        onPressed: (){
                          scoring();
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Score(title: widget.title, score: score)));
                        },
                        child:Text("Submit", style: TextStyle(color: const Color.fromARGB(255, 250, 255, 221),fontFamily: 'basic', fontSize: 20))
                      ),
                    ),
                  ),
            

          ],
        ),
      ),
    );
  }
}