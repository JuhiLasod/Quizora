import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "Home.dart";

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key});
  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  String title = "";
  TextEditingController _titlec = TextEditingController();

  // List of all questions added so far
  List<Map<String, dynamic>> questions = [];

  // List of question form controllers
  List<QuestionForm> questionForms = [];

  void setQuiz() async {
    if (title.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill title of the quiz")),
      );
      return;
    }
    final res = await http.post(
      Uri.parse('https://quizora-nces.onrender.com/quiz/set-quiz'),
      headers: {'Content-type': 'application/json'},
      body: json.encode({
        'title': title,
        'Questions': questions,
        "total": questions.length
      }),
    );
    print(res.statusCode);
    if(res.statusCode==200)
    {
      print("Quiz sent");
      print(res.body);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    }
    
  }

  void addNewQuestionForm() {
    setState(() {
      questionForms.add(QuestionForm(
        key: UniqueKey(),
        onSave: (quesObj) {
          questions.add(quesObj);
        },
      ));
    });
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
              Text("Create Quiz",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 28, 91, 46),fontSize: 45, fontFamily: 'title'),),
              Spacer(),
              GestureDetector(onTap: (){}, child: Image.asset("assets/images/logo.png",width: screenWidth *0.15,))
            ]),
          ),
          
        ),
      body: Padding(
        padding:  EdgeInsets.fromLTRB(screenWidth * 0.05,screenHeight * 0.05,screenWidth * 0.05 ,0),
        child: ListView(
          children: [
            TextField(
              controller: _titlec,
              decoration: InputDecoration(hintText: "Quiz Title",hintStyle: TextStyle(color: const Color.fromARGB(255, 25, 94, 30).withAlpha(100)),border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
            // const SizedBox(height: 20),
            Padding(padding: EdgeInsets.fromLTRB(0,screenHeight * 0.05, 0, screenHeight * 0.01),
                    child: Container(
                      width : screenWidth * 0.8,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),backgroundColor: Color.fromARGB(255, 28, 91, 46),),
                        onPressed: (){
                          setQuiz();
                        },
                        child:Text("Submit Quiz", style: TextStyle(color: const Color.fromARGB(255, 250, 255, 221),fontFamily: 'basic', fontSize: 20))
                      ),
                    ),
                  ),
            Padding(padding: EdgeInsets.fromLTRB(0,screenHeight * 0.01, 0, screenHeight * 0.01),
                    child: Container(
                      width : screenWidth * 0.8,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),backgroundColor: Color.fromARGB(255, 28, 91, 46),),
                        onPressed: (){
                          addNewQuestionForm();
                        },
                        child:Text("Add Question", style: TextStyle(color: const Color.fromARGB(255, 250, 255, 221),fontFamily: 'basic', fontSize: 20))
                      ),
                    ),
                  ),
            
            
            ...questionForms,
          ],
        ),
      ),
    );
  }
}


class QuestionForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onSave;

  const QuestionForm({super.key, required this.onSave});

  @override
  State<QuestionForm> createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  final TextEditingController _quesC = TextEditingController();
  final List<TextEditingController> _optionCs =
      List.generate(4, (_) => TextEditingController());

  int? _correctIndex;

  void saveQuestion() {
    final options = _optionCs.map((c) => c.text).toList();
    final question = _quesC.text;

    if (question.trim().isEmpty ||
        options.any((o) => o.trim().isEmpty) ||
        _correctIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields & select correct option")),
      );
      return;
    }

    widget.onSave({
      "ques": question,
      "options": options,
      "ans": options[_correctIndex!],
      
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Question Added")),
    );

    setState(() {
      _quesC.clear();
      for (var c in _optionCs) c.clear();
      _correctIndex = null;
    });
  }

  @override
  void dispose() {
    _quesC.dispose();
    for (var c in _optionCs) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;
    return Card(
      color: const Color.fromARGB(255, 233, 254, 221),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _quesC,
              decoration: InputDecoration(hintText: "Question",hintStyle: TextStyle(color: const Color.fromARGB(255, 25, 94, 30).withAlpha(100)),border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
            ),
            
            ...List.generate(4, (i) {
              return ListTile(
                title: TextField(
              controller: _optionCs[i],
              decoration: InputDecoration(hintText: "Option ${i + 1}",hintStyle: TextStyle(color: const Color.fromARGB(255, 25, 94, 30).withAlpha(100)),border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
            ),
            // TextField(
            //       controller: _optionCs[i],
            //       decoration: InputDecoration(labelText: "Option ${i + 1}"),
            //     ),
                leading: Radio<int>(
                  value: i,
                  groupValue: _correctIndex,
                  onChanged: (value) {
                    setState(() {
                      _correctIndex = value;
                    });
                  },
                  activeColor: const Color.fromARGB(255, 25, 94, 30),
                ),
              );
            }),
            Padding(padding: EdgeInsets.fromLTRB(0,screenHeight * 0.01, 0, screenHeight * 0.01),
                    child: Container(
                      width : screenWidth * 0.8,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),backgroundColor: Color.fromARGB(255, 28, 91, 46),),
                        onPressed: (){
                          saveQuestion();
                        },
                        child:Text("Save Question", style: TextStyle(color: const Color.fromARGB(255, 250, 255, 221),fontFamily: 'basic', fontSize: 20))
                      ),
                    ),
                  ),
            // SizedBox(height: 10),
            // ElevatedButton(onPressed: saveQuestion, child: Text("Save Question")),
          ],
        ),
      ),
    );
  }
}
