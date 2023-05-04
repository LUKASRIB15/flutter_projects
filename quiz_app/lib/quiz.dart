import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswer = [];
  var activeScreen = 'home-screen';
  Widget? currentScreen;
  @override
  void initState() {
    currentScreen = HomeScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState((){
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswer.add(answer);
    if(selectedAnswer.length == questions.length){
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    if(activeScreen=="home-screen"){
      currentScreen = HomeScreen(switchScreen);
    }

    if(activeScreen=="questions-screen"){
      currentScreen = QuestionsScreen(onSelectedAnswer: chooseAnswer);
    }

    if(activeScreen=="results-screen"){
      currentScreen = ResultScreen(chosenAnswers: selectedAnswer, onRestart: restartQuiz,);
    }

    return  MaterialApp(
      home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 76, 12, 186), Color.fromARGB(255, 118, 48, 179)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        ),
        child: currentScreen,
      ),
    ),
  );
  }
}