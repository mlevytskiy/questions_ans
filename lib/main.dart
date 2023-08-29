import 'package:flutter/material.dart';

import 'question.dart';
import 'question_widget.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Question> questions = [
    Question(question: "1+1", answear: 2, marks: 1),
    Question(question: "3x3", answear: 9, marks: 1),
    Question(question: "27/3", answear: 9, marks: 1),
  ];

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
              child: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (BuildContext context, int index) {
          return QuestionWidget(question: questions[index]);
        },
      ))),
    );
  }
}
