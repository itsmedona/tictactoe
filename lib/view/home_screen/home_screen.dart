import 'package:flutter/material.dart';
import 'package:tictactoe/controller/logic.dart';
import 'package:tictactoe/utils/color_constant.dart';

class HomePage extends StatefulWidget {
  final String player1Name;
  final String player2Name;

  const HomePage({super.key, required this.player1Name, required this.player2Name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String lastValue = Player.x;
  bool gameOver = false;
  List<int> scoreboard = List.filled(8, 0);
  int turn = 0;
  String result = "";
  Game game = Game();

  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
    print(game.board);
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    String currentPlayer = lastValue == Player.x ? widget.player1Name : widget.player2Name;

    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "It's $currentPlayer's turn".toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: boardWidth,
            height: boardWidth,
            child: GridView.count(
              crossAxisCount: Game.boardLength ~/ 3,
              padding: EdgeInsets.all(16.0),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(Game.boardLength, (index) {
                return InkWell(
                  onTap: gameOver
                      ? null
                      : () {
                          if (game.board![index] == Player.empty) {
                            setState(() {
                              game.board![index] = lastValue;
                              turn++;
                              gameOver = game.winnerCheck(
                                  lastValue, index, scoreboard, 3);
                              if (gameOver) {
                                result = "$currentPlayer is the winner";
                              } else if (!gameOver && turn == 9) {
                                result = "It's a Draw!";
                                gameOver = true;
                              }
                              lastValue = lastValue == Player.x ? Player.y : Player.x;
                            });
                          }
                        },
                  child: Container(
                    width: Game.blocSize,
                    height: Game.blocSize,
                    decoration: BoxDecoration(
                      color: MainColor.secondaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        game.board![index],
                        style: TextStyle(
                          color: game.board![index] == Player.x
                              ? Colors.blue
                              : Colors.red,
                          fontSize: 64.0,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 30),
          Text(
            result,
            style: TextStyle(color: Colors.white, fontSize: 54),
          ),
          ElevatedButton.icon(
            label: Text("Repeat the game"),
            onPressed: () {
              setState(() {
                game.board = Game.initGameBoard();
                lastValue = Player.x;
                gameOver = false;
                turn = 0;
                result = "";
                scoreboard = List.filled(8, 0);
              });
            },
            icon: Icon(
              Icons.replay,
              size: 30,
              color: MainColor.accentColor,
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MainColor.secondaryColor)),
          )
        ],
      ),
    );
  }
}
