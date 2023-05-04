import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryData extends StatelessWidget{
  const SummaryData(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
      children: [
        ...summaryData.map((data){
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                  color: data['correct_answer'] == data['user_answer']? const Color.fromARGB(255, 90, 151, 92): const Color.fromARGB(172, 239, 68, 56),
                ),
                child: Text(
                ((data['question_id'] as int) + 1).toString(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 35, 7, 82),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['question'] as String,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    data['correct_answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(126, 255, 255, 255),
                      fontSize: 16,
                    )
                  ),
                  Text(
                    data['user_answer'] as String,
                    style: const TextStyle(
                      color:  Color.fromARGB(255, 90, 151, 92),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )
                  ),
                ],
              ),
              ),
            ],
        )
          );
        }),
      ]
    ),
      ),
    );
  }
}