import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/providers/game_mode_provider.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';
import 'package:tic_tac_toe/temp.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    Color bone = const Color(0xffD8CFBC);
    Color smokyBlack = const Color(0xff11120D);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(
            fontFamily: 'Fredoka',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: screenWidth / 7),
              Image.asset(
                'assets/images/tic_tac_toe_${Theme.of(context).brightness.name}_theme.png',
              ),
            ],
          ),
          Positioned(
            child: Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: Theme.of(context).brightness == Brightness.dark
                      ? [
                          smokyBlack.withOpacity(0.6),
                          bone.withOpacity(0.4),
                        ]
                      : [
                          bone.withOpacity(0.6),
                          smokyBlack.withOpacity(0.4),
                        ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: screenWidth / 1.5,
                      height: screenWidth / 7,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          ref
                              .read(gameModeProvider.notifier)
                              .setToSinglePlayer('Single player');

                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => const GameScreen(),
                          //   ),
                          // );

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Temp(),
                            ),
                          );
                        },
                        child: Text(
                          'Single player',
                          style: TextStyle(
                            fontSize: screenWidth / 22,
                            fontFamily: 'Fredoka',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: screenWidth / 1.5,
                      height: screenWidth / 7,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          ref
                              .read(gameModeProvider.notifier)
                              .setToMultiplayer('Multiplayer');

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const GameScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Multiplayer',
                          style: TextStyle(
                            fontSize: screenWidth / 22,
                            fontFamily: 'Fredoka',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth / 4),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
