import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/functions/analyze_game_board.dart';
import 'package:tic_tac_toe/functions/play_audio.dart';
import 'package:tic_tac_toe/providers/ai_game_board.dart';
import 'package:tic_tac_toe/providers/game_mode_provider.dart';
import 'package:tic_tac_toe/providers/game_status_provider.dart';
import 'package:tic_tac_toe/providers/tile_text_provider.dart';

class Tile extends ConsumerStatefulWidget {
  const Tile(
      {required this.left,
      required this.right,
      required this.top,
      required this.bottom,
      required this.index,
      super.key});

  final BorderSide left;
  final BorderSide right;
  final BorderSide top;
  final BorderSide bottom;
  final int index;

  @override
  ConsumerState<Tile> createState() => _TileState();
}

class _TileState extends ConsumerState<Tile> {
  // int minimax(List<int> board, int player) {
  //   int pos = -1;
  //   int value = -2;
  //   for (int i = 0; i < 9; i++) {
  //     if (board[i] == 0) {
  //       board[i] = player;
  //       int score = -minimax(board, player * -1);
  //       if (score > value) {
  //         value = score;
  //         pos = i;
  //       }
  //       board[i] = 0;
  //     }
  //   }
  //   if (pos == -1) {
  //     return 0;
  //   }
  //   return value;
  // }
  //
  // int compTurn(List<int> board) {
  //   int pos = -1;
  //   int value = -2;
  //   for (int i = 0; i < 9; i++) {
  //     if (board[i] == 0) {
  //       board[i] = 1;
  //       int score = -minimax(board, -1);
  //       board[i] = 0;
  //       if (score > value) {
  //         value = score;
  //         pos = i;
  //       }
  //     }
  //   }
  //
  //   return pos;
  // }

  //
  //
  //
  //
  //
  //

  int minimax(List<int> board, int player) {
    int pos = -1;
    int value = -2;

    for (int i = 0; i < 9; i++) {
      if (board[i] == 0) {
        board[i] = player;
        int score = -minimax(board, -player);
        if (score > value) {
          value = score;
          pos = i;
        }
        board[i] = 0; // Undo move
      }
    }

    if (pos == -1) {
      return 0; // Draw
    }

    return value;
  }

  int compTurn(List<int> board) {
    int pos = -1;
    int value = -2;

    for (int i = 0; i < 9; i++) {
      if (board[i] == 0) {
        board[i] = 1; // AI's move
        int score = -minimax(board, -1);
        board[i] = 0; // Undo move
        if (score > value) {
          value = score;
          pos = i;
        }
      }
    }

    return pos;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final lst = ref.watch(tileTextProvider);
    final gameMode = ref.watch(gameModeProvider);
    final gameStatus = ref.watch(gameStatusProvider);
    final board = ref.watch(aiGameBoardProvider);

    Tween<double> tween = Tween(begin: 0, end: screenWidth / 5);

    Color bone = const Color(0xffD8CFBC);
    Color smokyBlack = const Color(0xff11120D);

    Color color =
        Theme.of(context).brightness == Brightness.dark ? bone : smokyBlack;

    return InkWell(
      onTap: () {
        if (gameStatus == 'not over') {
          if (lst.contains(widget.index)) {
            return;
          }

          // playTapAudio();

          if (gameMode == 'Multiplayer') {
            setState(() {
              ref.read(tileTextProvider.notifier).addIndex(widget.index);
            });
            analyzeGameBoard(lst, ref);
          } else if (gameMode == 'Single player') {
            setState(() {
              ref.read(aiGameBoardProvider.notifier).addIndex(widget.index, -1);
              ref.read(tileTextProvider.notifier).addIndex(widget.index);
            });

            analyzeGameBoard(lst, ref);

            int ai = compTurn(board);

            setState(() {
              ref.read(aiGameBoardProvider.notifier).addIndex(ai, 1);
              ref.read(tileTextProvider.notifier).addIndex(ai);
            });

            analyzeGameBoard(lst, ref);
          }
        }
      },
      child: Container(
        height: screenWidth / 3.3,
        width: screenWidth / 3.3,
        decoration: BoxDecoration(
          border: Border(
            left: widget.left,
            right: widget.right,
            top: widget.top,
            bottom: widget.bottom,
          ),
        ),
        child: Center(
          child: lst[widget.index] == 'X' || lst[widget.index] == 'O'
              ? TweenAnimationBuilder<double>(
                  tween: tween,
                  duration: const Duration(milliseconds: 250),
                  builder: (context, value, child) {
                    return Text(
                      lst[widget.index],
                      style: TextStyle(
                        fontSize: value,
                        fontFamily: 'FredokaB',
                        color: color,
                      ),
                    );
                  },
                )
              : const Text(''),
        ),
      ),
    );
  }
}
