import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/summary_data.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];
    for(var i=0; i<chosenAnswers.length; i++){
      summary.add({
        'question_id': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context){
    var correctsQuestions = getSummaryData().where((data){
      return data['correct_answer'] == data['user_answer']; 
    }).length;
    var totalQuestions = questions.length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctsQuestions out of $totalQuestions questions correctly!",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold, 
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            SummaryData(getSummaryData()),
            const SizedBox(height: 40,),
            TextButton.icon(
              onPressed: onRestart, 
              icon: const Icon(Icons.restart_alt_sharp),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text("Restart Quiz!"),
            ),
          ],
        ),
      ),
    );
  }
}