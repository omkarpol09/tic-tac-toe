import 'package:flutter/material.dart';

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  List<dynamic> board = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  int minimax(List<dynamic> board, int player) {
    int x = analyzeBoard(board);
    if (x != 0) {
      return x * player;
    }
    int pos = -1;
    int value = -2;
    for (int i = 0; i < 9; i++) {
      if (board[i] == 0) {
        board[i] = player;
        int score = -minimax(board, player * -1);
        if (score > value) {
          value = score;
          pos = i;
        }
        board[i] = 0;
      }
    }
    if (pos == -1) {
      return 0;
    }
    return value;
  }

  void compTurn(List<dynamic> board) {
    int pos = -1;
    int value = -2;
    for (int i = 0; i < 9; i++) {
      if (board[i] == 0) {
        board[i] = 1;
        int score = -minimax(board, -1);
        board[i] = 0;
        if (score > value) {
          value = score;
          pos = i;
        }
      }
    }
    board[pos] = 1;
    // board[pos] = 'O';
  }

  int analyzeBoard(List<dynamic> board) {
    List<List<int>> cb = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];

    for (int i = 0; i < 8; i++) {
      if (board[cb[i][0]] != 0 &&
          board[cb[i][0]] == board[cb[i][1]] &&
          board[cb[i][0]] == board[cb[i][2]]) {
        return board[cb[i][2]];
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: InkWell(
              onTap: () {
                setState(() {
                  board[index] = -1;
                  print(board);
                  compTurn(board);
                  print(board);
                });
              },
              child: Container(
                color: Colors.deepOrangeAccent,
                child: Center(
                  child: Text(
                    board[index].toString(),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
