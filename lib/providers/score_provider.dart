import 'package:flutter_riverpod/flutter_riverpod.dart';

class XScoreNotifier extends StateNotifier<int> {
  XScoreNotifier() : super(0);

  int score = 0;

  void updateXScore() {
    score += 1;
    state = score;
  }

  void initializeXScore() {
    score = 0;
    state = score;
  }
}

class OScoreNotifier extends StateNotifier<int> {
  OScoreNotifier() : super(0);

  int score = 0;

  void updateOScore() {
    score += 1;
    state = score;
  }

  void initializeOScore() {
    score = 0;
    state = score;
  }
}

class TotalDrawsNotifier extends StateNotifier<int> {
  TotalDrawsNotifier() : super(0);

  int score = 0;

  void updateDrawScore() {
    score += 1;
    state = score;
  }

  void initializeDrawScore() {
    score = 0;
    state = score;
  }
}

final xScoreProvider = StateNotifierProvider<XScoreNotifier, int>(
  (ref) {
    return XScoreNotifier();
  },
);

final oScoreProvider = StateNotifierProvider<OScoreNotifier, int>(
  (ref) {
    return OScoreNotifier();
  },
);

final totalDrawsProvider = StateNotifierProvider<TotalDrawsNotifier, int>(
  (ref) {
    return TotalDrawsNotifier();
  },
);
