import 'package:flutter/material.dart';
import 'package:tictactoe/utils/color_constant.dart';
import '../home_screen/home_screen.dart'; // Import your Home Screen

class NameScreen extends StatelessWidget {
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor, // Set background color
      appBar: AppBar(
        title: Text('Enter Player Names'),
        backgroundColor: MainColor.secondaryColor, // Set AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Enhanced TextField for Player 1
            TextField(
              controller: player1Controller,
              decoration: InputDecoration(
                labelText: 'Player 1 Name (X)',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                filled: true,
                fillColor: MainColor.secondaryColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide:
                      BorderSide(color: MainColor.accentColor, width: 2),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              style: TextStyle(color: Colors.white),
              cursorColor: MainColor.accentColor,
            ),
            SizedBox(height: 20),
            // Enhanced TextField for Player 2
            TextField(
              controller: player2Controller,
              decoration: InputDecoration(
                labelText: 'Player 2 Name (O)',
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                filled: true,
                fillColor: MainColor.secondaryColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.white, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide:
                      BorderSide(color: MainColor.accentColor, width: 2),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              style: TextStyle(color: Colors.white),
              cursorColor: MainColor.accentColor,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                String player1Name = player1Controller.text;
                String player2Name = player2Controller.text;
                if (player1Name.isNotEmpty && player2Name.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        player1Name: player1Name,
                        player2Name: player2Name,
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    MainColor.accentColor, // Button background color
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text(
                'Start Game',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
