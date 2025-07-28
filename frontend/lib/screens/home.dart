import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'CreateQuiz.dart';

class Home extends StatefulWidget{
  const Home({super.key});
  @override
  State<Home> createState()=>_homeState();
}
class _homeState extends State<Home>
{
  bool show=false;

  void initState() {
    super.initState();

    // Wait for 2 seconds (or the length of your animation), then show the button
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        show = true;
      });
    });
  }
  @override
  Widget build (BuildContext context)
  {
    
    return Scaffold(
        backgroundColor: Colors.black,
        body: show?
        
          Padding(padding: EdgeInsets.all(40),
            child: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateQuiz()));},child:Text("create quiz")))
        
    //       child:Text("create quiz"))
        :Center(
          child: DefaultTextStyle(
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 52.0,
              fontFamily: 'title',
              color: Colors.white,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Quizora',
                  speed: const Duration(milliseconds: 400),
                ),
              ],
              isRepeatingAnimation: false,
              onFinished: (){
                setState(() {
                  show=true;
                });
              },
            ),
          ),
          
          
        ),
        
      
    );
    // Scaffold(
    //   body:Padding(padding: EdgeInsets.all(40),
    //     child: ElevatedButton(
    //       onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateQuiz()));},
    //       child:Text("create quiz")
    //     ),
    //   )
    // );
  }
}