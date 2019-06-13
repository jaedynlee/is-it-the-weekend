import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weekend_app/answer_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Is it the weekend?',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: AppBarTheme(
          color: Colors.grey.shade200,
        ),
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.all(20.0),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
            side: BorderSide(color: Colors.pink),
          ),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: MyHomePage(
          title: DateFormat('MMMM d, y').format(DateTime.now()),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _answer = AnswerGenerator.getAnswer(DateTime.now().weekday);

  void _updateAnswer() {
    setState(() {
      int weekday = DateTime.now().weekday;
      _answer = AnswerGenerator.getAnswer(weekday);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: _updateAnswer,
              textColor: Colors.pink,
              child: Text(
                'IS IT THE WEEKEND?',
                style: new TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Text(
              '$_answer',
              style: new TextStyle(
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
