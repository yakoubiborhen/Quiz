import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
void main() => runApp(Quiz());

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  List<Question> questions = [
    Question("The black box in a plane is black", false),
    Question("Marrakesh is the capital of Morocco", false),
    Question("Gin is typically included in a Long Island Iced Tea", true),
    Question("The unicorn is the national animal of Scotland", true),
    Question("Monaco is the smallest country in the world", false),
    Question("The river Seine in Paris is longer than the river Thames in London", true),
    Question("Alaska is the biggest American state in square miles", true),
    Question("Ariana Grande is 25 or under", false),
    Question("Madonna's real name is Madonna", true),
    Question("Thomas Edison discovered gravity", false),
    Question("Spaghetto is the singular word for a piece of spaghetti", true),


  ];

  int questionIndex = 0;
  String answer = "";
  int score =0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Quiz",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(


        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 600.0,
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                        padding:EdgeInsets.only(bottom: 5.0),
                      child:Text(
                        "Question #${questionIndex+1}",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                    ),

                    Text(
                        questions[questionIndex].question,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child:Text(
                        answer,
                        style: TextStyle(
                            color: answer =="Correct" ? Colors.green : Colors.red,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child:Text(
                        score.toString(),
                        style: TextStyle(
                            color: answer =="Correct" ? Colors.green : Colors.red,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(child:
            Row(
              children: [
                Expanded(child:
                 GestureDetector(
                  child: Container(
                    color: Color(0xff003049),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          "True",
                          style: TextStyle(
                            color: Color(0xFFFFE6AC),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900
                          ),
                      ),
                    ),
                  ),
                  onTap: (){
                    if(questions[questionIndex].answer == true) {
                      setState(() {
                        questionIndex++;
                        answer = "Correct";
                        score++;
                      });
                    }
                    else {
                      setState(() {
                        questionIndex++;
                        answer = "Incorrect";
                        score= score+0;
                      });
                    }
                  },
                 )
                ),
                Expanded(child:
                 GestureDetector(
                  child: Container(
                    color: Colors.red,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "False",
                        style: TextStyle(
                            color: Color(0xFFFFE6AC),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                  ),
                   onTap: (){
                     if(questions[questionIndex].answer == false) {
                       setState(() {
                         questionIndex++;
                         answer = "Correct";
                         score++;
                       });
                     }
                     else {
                       setState(() {
                         questionIndex++;
                         answer = "Incorrect";
                         score=score+0;
                       });
                     }
                   },

                 )
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
