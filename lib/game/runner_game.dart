import 'dart:async';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import '../models/game_controller.dart';
import 'player.dart';

/// Main Flame game class
class RunnerGame extends FlameGame {
  final GameController gameController = GameController();
  late Player player;

  double rockSpawnTimer = 0;
  double rockSpawnInterval = 2.0; // seconds

  @override
  Color backgroundColor() => const Color(0xFFFFFFFF);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    player = Player();
    add(player);

    gameController.startGame();
  }

  @override
  void onTapDown(TapDownEvent event) {
    final tapX = event.localPosition.x;
    final screenWidth = size.x;

    if (tapX < screenWidth / 2) {
      gameController.handleInput('UP');
    } else {
      gameController.handleInput('RIGHT');
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawLine(
      Offset(0, size.y),
      Offset(size.x, size.y),
      Paint()
        ..color = const Color(0xFFE5E7EB)
        ..strokeWidth = 2,
      // ..opa = 0.3,
    );
  }
}
