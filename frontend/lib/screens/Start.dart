import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'Home.dart';

class Start extends StatefulWidget{
  const Start({super.key});
  @override
  State<Start> createState()=> _StartState();
}

class _StartState extends State<Start>
{
  @override 
  Widget build(BuildContext context)
  {
    final screenHeight= MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 255, 221),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
            
            Padding(padding: EdgeInsets.all(50),
              child: Container(
                height: screenHeight * 0.1,
                child: Image.asset('assets/images/logo.png')
              ),
            ),
            DefaultTextStyle(
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 52.0,
              fontFamily: 'title',
              color: Color.fromARGB(255, 28, 91, 46)
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Quizora',
                  
                  speed: const Duration(milliseconds: 500),
                ),
              ],
              isRepeatingAnimation: false,
              onFinished: ()async{
                await Future.delayed(Duration(seconds: 1));
                setState(() {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Home()));
                });
              },
            ),
          ),
          ])
          
        ),
    );
  }
}