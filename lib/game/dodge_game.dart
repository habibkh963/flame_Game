import 'dart:async';
import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import '../models/game_controller.dart';
import 'background.dart';
import 'player.dart';
import 'rocket.dart';

class DodgeGame extends FlameGame {
  final GameController gameController = GameController();
  late ScrollingBackground background;
  late Player player;
  final List<Rocket> rockets = [];
  double meteorSpawnTimer = 0;
  double meteorSpawnInterval = 1.5;
  double meteorSpeed = 150;

  @override
  Color backgroundColor() => const Color(0xFF333333);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    background = ScrollingBackground();
    add(background);

    player = Player();
    add(player);

    gameController.startGame();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (gameController.state != GameState.playing) return;

    gameController.updateScore(dt);

    meteorSpawnTimer += dt;
    if (meteorSpawnTimer >= meteorSpawnInterval) {
      spawnMeteor();
      meteorSpawnTimer = 0;

      meteorSpawnInterval = (meteorSpawnInterval * 0.98).clamp(0.5, 2.0);
      meteorSpeed += 10;
    }

    rockets.removeWhere((meteor) {
      if (meteor.isOffScreen(size.y)) {
        remove(meteor);
        return true;
      }
      return false;
    });
  }

  void spawnMeteor() {
    final meteorX = gameController.generateMeteorX();
    final meteor = Rocket(
      x: meteorX,
      y: -GameController.rocketHeight,
      speed: meteorSpeed,
    );

    rockets.add(meteor);
    add(meteor);
  }

  @override
  void onTapDown(TapDownEvent event) {
    final tapX = event.localPosition.x;
    final screenWidth = size.x;

    if (tapX < screenWidth / 2) {
      gameController.handleInput('LEFT');
    } else {
      gameController.handleInput('RIGHT');
    }
  }
}
