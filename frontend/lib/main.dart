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