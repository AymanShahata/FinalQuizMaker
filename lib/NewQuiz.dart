import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewQuiz extends StatefulWidget {
  const NewQuiz({Key? key}) : super(key: key);

  @override
  State<NewQuiz> createState() => _NewQuizState();
}

class _NewQuizState extends State<NewQuiz> {
  final questionsCtrl = TextEditingController();
  final examCtrl = TextEditingController();

  final instance = FirebaseFirestore.instance;
  final listOfExams = <String>[];
  String? selectedExam;
  @override
  Widget build(BuildContext context) {
    CollectionReference quizzes = FirebaseFirestore.instance.collection('quizzes');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text("Add new quiz"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: questionsCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Question',
              ),
            ),
          ),
          Row(children: <Widget>[
            IconButton(
              icon: const Icon(Icons.check),
              iconSize: 50,
              color: Colors.green,
              tooltip: 'Set answer to true',
              onPressed: () {
                instance
                    .collection('quizzes')
                    .doc(selectedExam)
                    .set({'Question': questionsCtrl.text, 'Answers': true});
              },
            ),
            IconButton(
                icon: const Icon(Icons.close),
                iconSize: 50,
                color: Colors.red,
                tooltip: 'Set answer to false',
                onPressed: () {
                  instance
                      .collection('quizzes')
                      .doc(selectedExam)
                      .set({'Question': questionsCtrl.text, 'Answers': false});
                })
          ]),
          StreamBuilder<QuerySnapshot>(
              stream: instance.collection("exams").snapshots(),
              builder: (context, snapshot) {
                final examList = snapshot.data?.docs ?? [];
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: DropdownButton<String>(
                    key: const Key("DropButton"),
                    items: examList
                        .map(((e) => DropdownMenuItem<String>(
                      child: Text(e.get("name") as String),
                      value: e.get("name") as String,
                    )))
                        .toList(),
                    onChanged: (item) => setState(() => selectedExam = item),
                    isExpanded: true,
                    value: selectedExam,
                    hint: const Text("Select Exam"),
                  ),
                );
              }),
          Row(children: <Widget>[
            IconButton(
                icon: const Icon(Icons.add),
                iconSize: 50,
                color: Colors.green,
                tooltip: 'Add new Exam',
                onPressed: () => instance
                    .collection("exams")
                    .doc()
                    .set({"name": examCtrl.text})),
            Expanded(
              child: TextField(
                controller: examCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'add new exam',
                ),
              ),
            ),
          ])
        ]),
      ),
    );
  }
}
