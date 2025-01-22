import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameModeNotifier extends StateNotifier<String> {
  GameModeNotifier() : super('');

  void setToMultiplayer(String gameMode) {
    state = gameMode;
  }

  void setToSinglePlayer(String gameMode) {
    state = gameMode;
  }
}

final gameModeProvider = StateNotifierProvider<GameModeNotifier, String>(
  (ref) {
    return GameModeNotifier();
  },
);
