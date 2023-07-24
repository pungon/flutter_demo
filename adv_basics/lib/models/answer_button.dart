import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key,
  required this.anstext,
  required this.onTap,
  });

  final String anstext;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40,),
        backgroundColor: const Color.fromARGB(255, 28, 2, 63),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),

      ),
      child: Text(anstext, textAlign:TextAlign.center,),
      
    );
  }
}
