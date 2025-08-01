import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class FillQuiz extends StatefulWidget {
  final title;
  final name;
  const FillQuiz({super.key, required this.title, required this.name});

  @override
  State<FillQuiz> createState() => _FillQuizState();
}

class _FillQuizState extends State<FillQuiz> {
  Map<String, dynamic> data = {"Questions": []};
  Map<int, String> selectedOptions = {}; // index -> selected option

  void fetchQues() async {
    final res = await http.get(
      Uri.parse('http://10.0.2.2:8000/quiz/fetch-ques?title=${widget.title}'),
      headers: {'Content-Type': 'application/json'},
    );
    setState(() {
      data = json.decode(res.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchQues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz: ${widget.title}")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Name: ${widget.name}", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: data['Questions'].length,
                itemBuilder: (context, index) {
                  final question = data['Questions'][index];
                  final options = question['options'] ?? [];

                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Q${index + 1}: ${question['ques']}", style: TextStyle(fontWeight: FontWeight.bold)),
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
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("User Answers:");
                selectedOptions.forEach((index, value) {
                  print("Q${index + 1}: $value");
                });
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
