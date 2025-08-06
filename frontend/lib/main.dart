import 'package:flutter/material.dart';
import 'screens/Start.dart';

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
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(cursorColor: Color.fromARGB(255, 28, 91, 46)),
        inputDecorationTheme: InputDecorationTheme(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 28, 91, 46),width:2)))),
      
      home: Start()
    );
  }
}
class UserPage extends StatefulWidget{
  State<UserPage> createState()=> UserPageState();
}
class UserPageState extends State<UserPage>
{
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
    );
  }
}