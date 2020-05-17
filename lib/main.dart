import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: _controller,
          autofocus: true,
          onChanged: (value) => sanitizeText(),
        )
      ],
    ));
  }

  void sanitizeText() {
    var initialtext = _controller.text;
    if (initialtext.length > 5) {
      // Replace field value with first and last letter of the string
      _controller.value =
          TextEditingValue(text: initialtext[0] + initialtext[5]);
      // Reposition the cursor because flutter...
      _controller.selection =
          TextSelection.collapsed(offset: _controller.text.length);
    }
  }
}
