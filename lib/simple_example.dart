import 'package:filled_text/filled_text.dart';
import 'package:flutter/material.dart';

class FilledTextExample extends StatelessWidget {
  FilledTextExample({Key? key}) : super(key: key);

  final filledText = FilledText(
    text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    mainStyle: const TextStyle(fontSize: 20),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filled Text Example')),
      body: FilledTextWidget(filledText: filledText),
    );
  }
}
