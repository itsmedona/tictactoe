class Player {
  static const x = "X";
  static const y = "O";
  static const empty = "";
}

class Game {
  static final boardLength = 9;
  static final blocSize = 100.0;

  List<String>? board;
  static List<String>? initGameBoard() =>
      List.generate(boardLength, (index) => Player.empty);

  bool winnerCheck(
      String player, int index, List<int> scoreboard, int gridsize) {
    int row = index ~/ 3;
    int col = index % 3;
    int score = player == Player.x ? 1 : -1;
    scoreboard[row] += score;
    scoreboard[gridsize + col] += score;
    if (row == col) scoreboard[2 * gridsize] += score;
    if (gridsize - 1 - col == row) scoreboard[2 * gridsize + 1] += score;

    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    }
    return false;
  }
}