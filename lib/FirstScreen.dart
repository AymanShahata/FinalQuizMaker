import 'package:flutter/material.dart';
import 'package:quiz1/ListOfQuizzes.dart';
import 'package:quiz1/NewQuiz.dart';
import 'NewQuiz.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
  static const _style = TextStyle(fontSize: 32);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Home"),
          centerTitle: true,
        ),
        body: Center(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: MediaQuery.of(context).size.height / 2),
            children: [
              ElevatedButton(

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListOfQuizzes()),
                    );
                  },
                  child: const Text(
                    'Take Quiz',
                    style: _style,
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewQuiz()),
                    );
                  },
                  child: const Text(
                    'Create Quiz',
                    style: _style,
                  )),
            ],
          ),
        ));
  }
}
