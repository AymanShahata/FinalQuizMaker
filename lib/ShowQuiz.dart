// import 'package:flutter/material.dart';
//
// List<Icon> answers = [];
//
// class Quiz extends StatefulWidget {
//   const Quiz({Key? key}) : super(key: key);
//
//   @override
//   _QuizState createState() => _QuizState();
// }
//
// class _QuizState extends State<Quiz> {
//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade900,
//       body: Column(
//         children: [
//           Text(
//             question.questions[counter]['Q'],
//             style: const TextStyle(color: Colors.white),
//           ),
//           TextButton(
//             onPressed: () {
//               bool value = question.questions[counter]['answer'];
//               if (value == true) {
//                 answers.add(const Icon(
//                   Icons.check,
//                   color: Colors.green,
//                 ));
//               } else {
//                 answers.add(const Icon(
//                   Icons.close,
//                   color: Colors.red,
//                 ));
//               }
//               setState(() {
//                 if (counter < question.questions.length - 1) {
//                   counter++;
//                 }
//                 // else if (counter == question.questions.length-1){
//                 //   counter = 0;
//                 //   answers.clear();
//                 // }
//               });
//             },
//             child: const Text('True'),
//           ),
//           TextButton(
//             onPressed: () {
//               bool value = question.questions[counter]['answer'];
//               if (value == false) {
//                 answers.add(const Icon(
//                   Icons.check,
//                   color: Colors.green,
//                 ));
//               } else {
//                 answers.add(const Icon(
//                   Icons.close,
//                   color: Colors.red,
//                 ));
//               }
//               setState(() {
//                 if (counter < question.questions.length - 1) {
//                   counter++;
//                 }
//                 // else if (counter == question.questions.length-1){
//                 //   counter = 0;
//                 //   answers.clear();
//                 // }
//               });
//             },
//             child: const Text('False'),
//           ),
//           SizedBox(
//             height: 50,
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: answers.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return answers[index];
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
