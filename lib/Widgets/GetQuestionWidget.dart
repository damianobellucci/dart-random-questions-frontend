import 'package:flutter/material.dart';
import 'package:myapp/Question/Question.dart';
import 'package:myapp/Question/fetchQuestion.dart';

class GetQuestion extends StatefulWidget {
  _GetQuestionState createState() => _GetQuestionState();
}

class _GetQuestionState extends State<GetQuestion> {
  Future<Question> val;

  void initState() {
    super.initState();
    val = fetchQuestion();
  }

  void change() {
    setState(() {
      val = fetchQuestion();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: FutureBuilder<Question>(
                  future: this.val,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.text);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ))),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Get',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => change(),
            ),
          ],
        ),
      ),
    );
  }
}
