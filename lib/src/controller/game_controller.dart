import 'dart:async';

import 'package:get/get.dart';

class GameController extends GetxController {
  RxInt currentSecond = RxInt(0);
  RxInt currentAnswerSecond = RxInt(5);
  RxInt randomNumber = RxInt(0);
  RxInt success = RxInt(0);
  RxInt failures = RxInt(0);
  RxInt attempts = RxInt(0);

  Timer? _timer;

  Rx<GameState> gameState = Rx<GameState>(GameState.idle);

  void resetGame() {
    currentSecond.value = 0;
    currentAnswerSecond.value = 5;
    randomNumber.value = 0;
    success.value = 0;
    failures.value = 0;
    attempts.value = 0;
    gameState.value = GameState.idle;
  }

  void startGame() {
    resetGame();
    _startTimer();
  }

  void checkAnswer() {
    randomNumber.value = _generateRandomNumber();
    if (currentSecond.value == randomNumber.value) {
      success.value++;
      gameState.value = GameState.playingSuccess;
    } else {
      failures.value++;
      gameState.value = GameState.playingFailure;
    }
    attempts.value++;
  }

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(const Duration(seconds: 1), () {
      if (currentSecond.value <= 59) {
        currentSecond.value++;
        currentAnswerSecond.value--;

        if (currentAnswerSecond.value <= 0) {
          currentAnswerSecond.value = 5;

          attempts.value++;
          failures.value++;
          gameState.value = GameState.playingTimeout;
        }
        _startTimer();
      } else {
        gameState.value = GameState.gameOver;
      }
    });
  }

  int _generateRandomNumber() {
    // return a random nnumber between 1 and 59
    return 1 +
        ((60 * (DateTime.now().microsecondsSinceEpoch % 1000) / 1000).floor());
  }
}

enum GameState {
  idle,
  playing,
  playingSuccess,
  playingFailure,
  playingTimeout,
  gameOver,
}
