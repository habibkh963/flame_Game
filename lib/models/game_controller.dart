import 'dart:math';

import 'package:flutter/material.dart';

enum GameState { idle, playing, gameOver }

class GameController {
  static final GameController _instance = GameController._internal();

  factory GameController() {
    return _instance;
  }

  GameController._internal();
  static late double screenWidth;
  static late double screenHeight;

  static void init(Size size) {
    screenWidth = size.width;
    screenHeight = size.height;
  }

  static double get roadWidth => screenWidth * 0.9;
  static double get playerLaneY => screenHeight * 0.75;

  GameState state = GameState.idle;
  int score = 0;
  int highScore = 0;

  double playerX = 50;
  bool isMoving = false;
  String? lastDirection;

  List<String> inputSequence = [];
  static const List<String> validSequences = ['LEFT-RIGHT', 'RIGHT-LEFT'];

  static const double playerWidth = 10;
  static const double playerHeight = 15;
  static const double rocketWidth = 20;
  static const double rocketHeight = 20;

  static const double moveDistance = 20;
  static const double rockHeight = 20;
  static const double rockWidth = 20;
  static const int meteorSpawnInterval = 1500; // milliseconds
  static const int scorePerDodge = 10;
  static const double groundLevel = 85;

  void startGame() {
    state = GameState.playing;
    score = 0;
    playerX = 50;
    inputSequence = [];
    lastDirection = null;
  }

  void update(double dt) {
    updateScore(dt);
  }

  double generateRockSpeed() {
    return 100 + Random().nextDouble() * 150;
  }

  void endGame() {
    state = GameState.gameOver;
    if (score > highScore) {
      highScore = score;
    }
  }

  void reset() {
    state = GameState.idle;
    inputSequence = [];
    lastDirection = null;
  }

  bool handleInput(String direction) {
    if (state != GameState.playing) return false;

    inputSequence.add(direction);

    if (inputSequence.length > 2) {
      inputSequence.removeAt(0);
    }

    if (direction == 'LEFT') {
      playerX = (playerX - moveDistance).clamp(0, roadWidth - playerWidth);
    } else if (direction == 'RIGHT') {
      playerX = (playerX + moveDistance).clamp(0, roadWidth - playerWidth);
    }

    if (inputSequence.length == 2) {
      String sequence = '${inputSequence[0]}-${inputSequence[1]}';
      if (validSequences.contains(sequence)) {
        score += scorePerDodge;
        inputSequence.clear();
        return true;
      }
    }

    return false;
  }

  bool checkCollision(double rocketX, double rocketY) {
    return playerX < rocketX + rocketWidth &&
        playerX + playerWidth > rocketX &&
        playerLaneY < rocketY + rocketHeight &&
        playerLaneY + playerHeight > rocketY;
  }

  double generateMeteorX() {
    final random = Random();
    return random.nextDouble() * (roadWidth - rocketWidth);
  }

  void updateScore(double deltaTime) {
    if (state == GameState.playing) {
      score += (deltaTime * 5).toInt(); // 5 points per second
    }
  }
}
