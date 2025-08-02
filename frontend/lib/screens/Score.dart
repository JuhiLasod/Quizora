import 'package:flutter/material.dart';

class Score extends StatefulWidget
{
  final score;
  const Score({super.key, required this.score});
  @override
  State<Score> createState()=> _ScoreState();
}

class _ScoreState extends State<Score>
{
  @override
  Widget build (BuildContext context)
  {
    return Scaffold(
      body: Center(child: Text(widget.score.toString()))
    );
  }
}