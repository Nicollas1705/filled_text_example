import 'package:filled_text_example/pages_example.dart';
import 'package:filled_text_example/simple_example.dart';
import 'package:flutter/material.dart';
import 'package:filled_text/filled_text.dart';

const longText =
    '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      // home: FilledTextExample(),
      home: FilledTextPagesExample(
        filledText: FilledText(
          text: longText,
          mainStyle: const TextStyle(fontSize: 20),
        ),
        // Controller used only to rebuild the next page button
        nextPageButtonController: Controller(),
      ),
    );
  }
}
