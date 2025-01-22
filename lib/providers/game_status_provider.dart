import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameStatusNotifier extends StateNotifier<String> {
  GameStatusNotifier() : super('not over');

  void updateStatus(String gameStatus) {
    state = gameStatus;
  }
}

final gameStatusProvider = StateNotifierProvider<GameStatusNotifier, String>(
  (ref) {
    return GameStatusNotifier();
  },
);
