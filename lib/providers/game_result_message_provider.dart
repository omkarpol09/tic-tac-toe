import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameResultMessageNotifier extends StateNotifier<String> {
  GameResultMessageNotifier() : super('');

  void updateGameResult(String result) {
    state = result;
  }
}

final gameResultMessageProvider =
    StateNotifierProvider<GameResultMessageNotifier, String>(
  (ref) {
    return GameResultMessageNotifier();
  },
);
