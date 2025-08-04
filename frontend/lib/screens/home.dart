import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
import 'CreateQuiz.dart';
import 'QuizDisplay.dart';

class Home extends StatefulWidget{
  const Home({super.key});
  @override
  State<Home> createState()=>_homeState();
}
class _homeState extends State<Home>
{
  // bool show=false;

  void initState() {
    super.initState();

  }
  @override
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
          // color: const Color.fromARGB(255, 240, 250, 183),
            child: Row(children: [
              Text("Quizora",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 28, 91, 46),fontSize: 45, fontFamily: 'title'),),
              Spacer(),
              GestureDetector(onTap: (){}, child: Image.asset("assets/images/logo.png",width: screenWidth *0.15,))
            ]),
          ),
          
        ),
        body: 
        
          Padding(padding: EdgeInsets.all(30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Smart questions, Sharper minds.",style:TextStyle(fontFamily: 'spaced', fontSize: 18,color: Color.fromARGB(255, 28, 91, 46))),
                  Padding(padding: EdgeInsetsGeometry.fromLTRB(0, screenHeight * 0.03, 0, 0),
                    child: Container(
                      height: screenHeight * 0.2,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Color.fromARGB(255, 216, 248, 225),border: Border.all(color: Color.fromARGB(255, 2, 49, 15), )),
                      child: Center(
                        child: Padding(padding: EdgeInsetsGeometry.fromLTRB(screenWidth * 0.05, 0, screenWidth * 0.05, 0),
                            child: Text("With Quizora, knowledge is just a tap away", 
                            textAlign:TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 28, 91, 46),
                              fontSize: 35, 
                              fontFamily: 'title'
                            ),
                          ),
                                            ),
                      ),

                  )),
                  Padding(padding: EdgeInsets.fromLTRB(0,screenHeight * 0.05, 0, screenHeight * 0.01),
                    child: Container(
                      width : screenWidth * 0.8,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),backgroundColor: Color.fromARGB(255, 28, 91, 46),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateQuiz()));
                        },
                        child:Text("Create Quiz", style: TextStyle(color: const Color.fromARGB(255, 250, 255, 221),fontFamily: 'basic', fontSize: 20))
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0,screenHeight * 0.01, 0, screenHeight * 0.05),
                    child: Container(
                      width : screenWidth * 0.8,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),backgroundColor: Color.fromARGB(255, 28, 91, 46),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizDisplay()));
                        },
                        child:Text("Attempt Quiz", style: TextStyle(color: const Color.fromARGB(255, 250, 255, 221),fontFamily: 'basic', fontSize: 20))
                      ),
                    ),
                  ),
                ]),
            ),
          )
        
    //       child:Text("create quiz"))
        // :Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children:[
            
        //     Padding(padding: EdgeInsets.all(50),
        //       child: Container(
        //         height: screenHeight * 0.1,
        //         child: Image.asset('assets/images/logo.png')
        //       ),
        //     ),
        //     DefaultTextStyle(
        //     style: const TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 52.0,
        //       fontFamily: 'title',
        //       color: Color.fromARGB(255, 28, 91, 46)
        //     ),
        //     child: AnimatedTextKit(
        //       animatedTexts: [
        //         TyperAnimatedText(
        //           'Quizora',
                  
        //           speed: const Duration(milliseconds: 600),
        //         ),
        //       ],
        //       isRepeatingAnimation: false,
        //       onFinished: ()async{
        //         await Future.delayed(Duration(seconds: 3));
        //         setState(() {
        //           show=true;
        //         });
        //       },
        //     ),
        //   ),
          // ])
          // 
        // ),
        
      
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