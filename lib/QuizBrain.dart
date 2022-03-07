import 'package:flutter/material.dart';
import 'package:quiz1/FirstScreen.dart';
import 'package:quiz1/NewQuiz.dart';
import 'NewQuiz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class NewQuiz extends StatelessWidget {
  const NewQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Question',
                  ),
                ),
              ),
              Row(
                  children:  <Widget>[
                    IconButton(
                      icon: Icon(Icons.check),
                      iconSize: 50,
                      color: Colors.green,
                      tooltip: 'Set answer to true',
                      onPressed: () {
                        // assign question and value of question in firebase to true and empty the text field
                      },

                    ),
                    IconButton(
                        icon: Icon(Icons.close),
                        iconSize: 50,
                        color: Colors.red,
                        tooltip: 'Set answer to false',
                        onPressed: () {
                          // assign question and value of question in firebase to false and empty the text field
                        })]
              )


            ]),
      ),
    );
  }
}