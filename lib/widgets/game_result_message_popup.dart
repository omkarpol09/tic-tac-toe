import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/providers/ai_game_board.dart';
import 'package:tic_tac_toe/providers/game_result_message_provider.dart';
import 'package:tic_tac_toe/providers/game_status_provider.dart';
import 'package:tic_tac_toe/providers/tile_text_provider.dart';

class GameResultMessagePopup extends ConsumerWidget {
  const GameResultMessagePopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final gameResult = ref.watch(gameResultMessageProvider);

    Color bone = const Color(0xffD8CFBC);
    Color smokyBlack = const Color(0xff11120D);

    Color color1 =
        Theme.of(context).brightness == Brightness.dark ? smokyBlack : bone;

    Color color2 =
        Theme.of(context).brightness == Brightness.dark ? bone : smokyBlack;

    Tween<Offset> tween = Tween(
      begin: Offset(0, -MediaQuery.of(context).size.height / 2),
      end: Offset.zero,
    );

    return Container(
      height: screenHeight,
      width: screenWidth,
      color: smokyBlack.withOpacity(0.4),
      child: Center(
        child: SizedBox(
          height: screenWidth / 1.9,
          width: screenWidth / 1.1,
          child: TweenAnimationBuilder<Offset>(
            tween: tween,
            duration: const Duration(milliseconds: 250),
            builder: (context, value, child) {
              return Transform.translate(
                offset: value,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        gameResult,
                        style: TextStyle(
                          fontFamily: 'Fredoka',
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth / 12,
                          color: color1,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(color1),
                          foregroundColor: WidgetStatePropertyAll(color2),
                        ),
                        onPressed: () {
                          ref
                              .read(gameStatusProvider.notifier)
                              .updateStatus('not over');

                          ref.read(tileTextProvider.notifier).initializeList();

                          ref
                              .read(aiGameBoardProvider.notifier)
                              .initializeAiGameBoard();
                        },
                        child: const Text(
                          'Play Again',
                          style: TextStyle(
                            fontFamily: 'Fredoka',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
