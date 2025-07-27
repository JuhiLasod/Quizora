import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main()
{
  runApp(myApp());
}
class myApp extends StatelessWidget{
  const myApp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: UserPage()
    );
  }
}
class UserPage extends StatefulWidget{
  State<UserPage> createState()=> UserPageState();
}
class UserPageState extends State<UserPage>
{
  String msg='';
  Future<void> adduser(String user)async{
    final res=await http.post(Uri.parse("http://10.0.2.2:8000/set-quiz"),
      headers: {'Content-Type':'application/json'},
      body:jsonEncode({})
    );
    setState(() {
      msg=res.body;
    });
    print(msg);
  }
  Widget build (BuildContext context)
  {
    return Scaffold(
      body:Padding(padding: EdgeInsets.all(40),child: ElevatedButton(onPressed: (){adduser("juhi");}, child: Text("press")))
    );
  }
}