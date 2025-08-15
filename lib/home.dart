import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
                color: const Color.fromARGB(148, 255, 255, 255),
              ),
              SizedBox(height: 80,),
              Text("Learn Flutter the fun way!", 
              style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 30,),
              OutlinedButton.icon(
                onPressed: startQuiz, 
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white
                ),
                icon: Icon(Icons.arrow_right_alt),
                label: const Text("Start Quiz")
          )
        ],
      ),
    );
  }
}