import 'package:flutter/material.dart';
import 'FillQuiz.dart';

class StartQuiz extends StatefulWidget{
  final title;
  const StartQuiz({super.key, required this.title});
  State<StartQuiz> createState()=> _StartQuizState();
}

class _StartQuizState extends State<StartQuiz>
{
  String name='';
  TextEditingController namec=TextEditingController();
  @override
  
  Widget build(BuildContext context)
  {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 250, 255, 221),
          title: Container(
            width: screenWidth *0.9, height: screenHeight*0.45,
            child: Row(children: [
              Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 28, 91, 46),fontSize: 45, fontFamily: 'title'),),
              Spacer(),
              GestureDetector(onTap: (){}, child: Image.asset("assets/images/logo.png",width: screenWidth *0.15,))
            ]),
          ),
          
        ),
      body: Padding(padding: EdgeInsets.all(30),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,children:[
           Padding(
            padding: EdgeInsets.fromLTRB(0, screenHeight * 0.02, 0,  screenHeight * 0.02),
            child: Container(
              alignment: AlignmentDirectional.topStart,
              child: Text("Enter your name", style:TextStyle(fontFamily: 'basic', color: Color.fromARGB(255, 28, 91, 46), fontSize: 25 ))
            )
          ),
           TextField(
            style: TextStyle(fontSize: 20),
              controller: namec,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0,screenHeight * 0.05, 0, screenHeight * 0.01),
                    child: Container(
                      width : screenWidth * 0.8,
                      height: screenHeight * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),backgroundColor: Color.fromARGB(255, 28, 91, 46),),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> FillQuiz(title: widget.title,name: name)));
                        },
                        child:Text("Start now !", style: TextStyle(color: const Color.fromARGB(255, 250, 255, 221),fontFamily: 'basic', fontSize: 20))
                      ),
                    ),
                  ),
          //  ElevatedButton(
          //   onPressed: (){
          //     print("name");
          //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FillQuiz(title: widget.title,name: name)));
          //   }, 
          //   child: Text("start now"))
        ]),
      )
    );
  }
}