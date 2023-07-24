import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData,{super.key,});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
    
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map(
              (data) {
                return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: data['user_answer'] == data['correct_answer']
                              ? const Color.fromARGB(255, 117, 156, 255) // สีฟ้า
                              : const Color.fromARGB(255, 255, 136, 221), // สีเดิม
                            
                             // สีพื้นหลังของวงกลม
                          ),
                          child: Text(((data['question_index'] as int) +1).toString(),
                          style:  GoogleFonts.lato(
                            color:  Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                            ),
                            ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data['question'] as String,
                             style: GoogleFonts.lato(
                              color:  Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              ) ),
                            const SizedBox(height: 5,),
                            Text(data['user_answer'] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 255, 136, 221),
                              fontSize: 12,
                              
                              ) 
                            ),
                            const SizedBox(height: 5,),
                            Text(data['correct_answer'] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 117, 156, 255),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              ) 
                            ),
                        ],),
                      ),                       
                  ]
                );
              },
              ).toList(),
          ),
        )
      )  
        );
  }
}
