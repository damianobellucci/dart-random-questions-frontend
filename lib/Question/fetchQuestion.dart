import 'package:myapp/Question/Question.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //for jsonDecode

Future<Question> fetchQuestion() async {
  final response = await http
      .get('https://random-questions-backend.herokuapp.com/getQuestion');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Question.fromJson(
        jsonDecode(response.body)); //code injection example
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load question');
  }
}
