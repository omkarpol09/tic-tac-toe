import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/tile.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Color bone = const Color(0xffD8CFBC);
    Color smokyBlack = const Color(0xff11120D);

    Color color =
        Theme.of(context).brightness == Brightness.dark ? bone : smokyBlack;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tile(
              left: BorderSide.none,
              right: BorderSide(
                width: 2,
                color: color,
              ),
              top: BorderSide.none,
              bottom: BorderSide(
                width: 2,
                color: color,
              ),
              index: 0,
            ),
            Tile(
              left: BorderSide(
                width: 2,
                color: color,
              ),
              right: BorderSide(
                width: 2,
                color: color,
              ),
              top: BorderSide.none,
              bottom: BorderSide(
                width: 2,
                color: color,
              ),
              index: 1,
            ),
            Tile(
              left: BorderSide(
                width: 2,
                color: color,
              ),
              right: BorderSide.none,
              top: BorderSide.none,
              bottom: BorderSide(
                width: 2,
                color: color,
              ),
              index: 2,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tile(
              left: BorderSide.none,
              right: BorderSide(
                width: 2,
                color: color,
              ),
              top: BorderSide(
                width: 2,
                color: color,
              ),
              bottom: BorderSide(
                width: 2,
                color: color,
              ),
              index: 3,
            ),
            Tile(
              left: BorderSide(
                width: 2,
                color: color,
              ),
              right: BorderSide(
                width: 2,
                color: color,
              ),
              top: BorderSide(
                width: 2,
                color: color,
              ),
              bottom: BorderSide(
                width: 2,
                color: color,
              ),
              index: 4,
            ),
            Tile(
              left: BorderSide(
                width: 2,
                color: color,
              ),
              right: BorderSide.none,
              top: BorderSide(
                width: 2,
                color: color,
              ),
              bottom: BorderSide(
                width: 2,
                color: color,
              ),
              index: 5,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tile(
              left: BorderSide.none,
              right: BorderSide(
                width: 2,
                color: color,
              ),
              top: BorderSide(
                width: 2,
                color: color,
              ),
              bottom: BorderSide.none,
              index: 6,
            ),
            Tile(
              left: BorderSide(
                width: 2,
                color: color,
              ),
              right: BorderSide(
                width: 2,
                color: color,
              ),
              top: BorderSide(
                width: 2,
                color: color,
              ),
              bottom: BorderSide.none,
              index: 7,
            ),
            Tile(
              left: BorderSide(
                width: 2,
                color: color,
              ),
              right: BorderSide.none,
              top: BorderSide(
                width: 2,
                color: color,
              ),
              bottom: BorderSide.none,
              index: 8,
            ),
          ],
        ),
      ],
    );
  }
}
