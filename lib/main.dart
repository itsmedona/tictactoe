import 'package:flutter/material.dart';
import 'package:tictactoe/view/home_page/home_page.dart';

void main() {
  runApp(tictactoe());
}

class tictactoe extends StatelessWidget {
  const tictactoe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      home: HomePage(),
    );
  }
}
