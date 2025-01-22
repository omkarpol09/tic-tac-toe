import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/providers/game_result_message_provider.dart';
import 'package:tic_tac_toe/providers/game_status_provider.dart';
import 'package:tic_tac_toe/providers/score_provider.dart';

void analyzeGameBoard(List<dynamic> lst, WidgetRef ref) {
  if (lst.length == 18) {
    if (lst[0] == lst[1] && lst[0] == lst[2]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[0] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[0] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[3] == lst[4] && lst[3] == lst[5]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[3] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[3] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[6] == lst[7] && lst[7] == lst[8]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[6] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[6] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[0] == lst[3] && lst[0] == lst[6]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[0] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[0] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[1] == lst[4] && lst[1] == lst[7]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[1] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[1] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[2] == lst[5] && lst[2] == lst[8]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[2] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[2] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[0] == lst[4] && lst[0] == lst[8]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[0] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[0] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[2] == lst[4] && lst[2] == lst[6]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[2] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[2] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      ref.read(totalDrawsProvider.notifier).updateDrawScore();
      ref
          .read(gameResultMessageProvider.notifier)
          .updateGameResult('It\'s a draw!');
    }
  } else {
    if (lst[0] == lst[1] && lst[0] == lst[2]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[0] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[0] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[3] == lst[4] && lst[3] == lst[5]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[3] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[3] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[6] == lst[7] && lst[7] == lst[8]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[6] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[6] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[0] == lst[3] && lst[0] == lst[6]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[0] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[0] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[1] == lst[4] && lst[1] == lst[7]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[1] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[1] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[2] == lst[5] && lst[2] == lst[8]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[2] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[2] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[0] == lst[4] && lst[0] == lst[8]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[0] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[0] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    } else if (lst[2] == lst[4] && lst[2] == lst[6]) {
      ref.read(gameStatusProvider.notifier).updateStatus('over');
      if (lst[2] == 'X') {
        ref.read(xScoreProvider.notifier).updateXScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('X has won!');
      } else if (lst[2] == 'O') {
        ref.read(oScoreProvider.notifier).updateOScore();
        ref
            .read(gameResultMessageProvider.notifier)
            .updateGameResult('O has won!');
      }
    }
  }
}
