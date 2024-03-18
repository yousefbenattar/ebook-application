import 'package:flutter/material.dart';

import '../models/books.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key,required this.book});
  final Books book ;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(widget.book.title)
      ],),
    );
  }
}