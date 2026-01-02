import 'package:flutter/material.dart';

enum GameState { running, danger, gameOver }

class GameController extends ChangeNotifier {
  static final GameController _instance = GameController._internal();
  factory GameController() => _instance;
  GameController._internal();

  GameState state = GameState.running;

  final List<String> _requiredMoves = ['up', 'right'];
  final List<String> _playerMoves = [];

  void setDanger() {
    state = GameState.danger;
    _playerMoves.clear();
    notifyListeners();
  }

  void onMove(String move) {
    if (state != GameState.danger) return;

    _playerMoves.add(move);

    if (_playerMoves.length == 2) {
      if (_playerMoves[0] == 'up' && _playerMoves[1] == 'right') {
        state = GameState.running;
      } else {
        state = GameState.gameOver;
      }
      _playerMoves.clear();
      notifyListeners();
    }
  }

  void reset() {
    state = GameState.running;
    notifyListeners();
  }
}
