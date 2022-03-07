import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListOfQuizzes extends StatefulWidget {
  const ListOfQuizzes({Key? key}) : super(key: key);

  @override
  State<ListOfQuizzes> createState() => _ListOfQuizzesState();
}

class _ListOfQuizzesState extends State<ListOfQuizzes> {
  final answers = <Widget>[];
  var counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('quizzes').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final quizList = snapshot.data!.docs;
              final quiz = quizList[counter].data() as Map<String, dynamic>;


              return Column(
                children: [

              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: quizList.length,
                itemBuilder: (BuildContext context, int index) {
                  final quiz = quizList[index].data() as Map<String, dynamic>;
                  final question = quiz['question'] as String;
                  final isCorrect = quiz['Answers'] as bool;
                  return ListTile(
                    title: Text(question),
                    tileColor: isCorrect ? Colors.lime : Colors.red,
                  );
                },
              );
            } else {
              return const Text("no quizzes");
            }
          }),
    );
  }
}
 