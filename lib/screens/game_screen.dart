import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/providers/ai_game_board.dart';
import 'package:tic_tac_toe/providers/game_status_provider.dart';
import 'package:tic_tac_toe/providers/score_provider.dart';
import 'package:tic_tac_toe/providers/tile_text_provider.dart';
import 'package:tic_tac_toe/widgets/game_board.dart';
import 'package:tic_tac_toe/widgets/game_result_message_popup.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameStatus = ref.watch(gameStatusProvider);
    final xScore = ref.watch(xScoreProvider);
    final oScore = ref.watch(oScoreProvider);
    final draws = ref.watch(totalDrawsProvider);

    final screenWidth = MediaQuery.of(context).size.width;

    Color bone = const Color(0xffD8CFBC);
    Color smokyBlack = const Color(0xff11120D);

    bool clearData() {
      ref.read(gameStatusProvider.notifier).updateStatus('not over');
      ref.read(tileTextProvider.notifier).initializeList();
      ref.read(xScoreProvider.notifier).initializeXScore();
      ref.read(oScoreProvider.notifier).initializeOScore();
      ref.read(totalDrawsProvider.notifier).initializeDrawScore();
      ref.read(aiGameBoardProvider.notifier).initializeAiGameBoard();

      return true;
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        Navigator.of(context).pop();
        clearData();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'X scored: $xScore',
                                style: TextStyle(
                                  fontSize: screenWidth / 19,
                                  fontFamily: 'Fredoka',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'O scored: $oScore',
                                style: TextStyle(
                                  fontSize: screenWidth / 19,
                                  fontFamily: 'Fredoka',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Card(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Draws: $draws',
                            style: TextStyle(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? bone
                                  : smokyBlack,
                              fontSize: screenWidth / 19,
                              fontFamily: 'Fredoka',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const GameBoard(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: screenWidth / 2.9,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            clearData();
                          },
                          child: const Text(
                            'Go back',
                            style: TextStyle(
                              fontFamily: 'Fredoka',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 2.9,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          onPressed: clearData,
                          child: const Text(
                            'Restart',
                            style: TextStyle(
                              fontFamily: 'Fredoka',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (gameStatus == 'over') const GameResultMessagePopup(),
          ],
        ),
      ),
    );
  }
}
