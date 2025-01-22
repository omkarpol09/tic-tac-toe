import 'package:flutter_riverpod/flutter_riverpod.dart';

List<dynamic> lst = [11, 12, 13, 14, 15, 16, 17, 18, 19];

class TileTextNotifier extends StateNotifier<List<dynamic>> {
  TileTextNotifier() : super([11, 12, 13, 14, 15, 16, 17, 18, 19]);

  void addIndex(int index) {
    if (lst.length % 2 == 0) {
      lst[index] = 'O';
      lst.add(index);
      state = lst;
    } else {
      lst[index] = 'X';
      lst.add(index);
      state = lst;
    }
    print(state);
  }

  void initializeList() {
    lst = [11, 12, 13, 14, 15, 16, 17, 18, 19];
    state = lst;
  }
}

final tileTextProvider = StateNotifierProvider<TileTextNotifier, List<dynamic>>(
  (ref) {
    return TileTextNotifier();
  },
);
