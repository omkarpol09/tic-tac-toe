import 'package:flutter_riverpod/flutter_riverpod.dart';

List<int> lst = [0, 0, 0, 0, 0, 0, 0, 0, 0];

class AiGameBoardNotifier extends StateNotifier<List<int>> {
  AiGameBoardNotifier() : super([0, 0, 0, 0, 0, 0, 0, 0, 0]);

  void addIndex(int index, int value) {
    if (lst[index] == 1 || lst[index] == -1) {
      return;
    }

    lst[index] = value;
    state = lst;

    print(state);
  }

  void initializeAiGameBoard() {
    lst = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    state = lst;
  }
}

final aiGameBoardProvider =
    StateNotifierProvider<AiGameBoardNotifier, List<int>>(
  (ref) {
    return AiGameBoardNotifier();
  },
);
