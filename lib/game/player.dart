import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../models/game_controller.dart';

/// Player character component
class Player extends PositionComponent with HasGameRef<FlameGame> {
  final GameController gameController = GameController();

  Player()
    : super(
        size: Vector2(GameController.playerWidth, GameController.playerHeight),
        position: Vector2(
          GameController.playerWidth * 5, // Center
          GameController.playerLaneY,
        ),
      );
  late ui.Image mage;

  @override
  Future<void> onLoad() async {
    // mage = await gameRef.images.load('IMG_0056.jpg');
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    const scaleFactor = 3.0;

    canvas.save();

    canvas.scale(scaleFactor);

    final bodyPaint = Paint()..color = const Color(0xFF1565C0);
    final capePaint = Paint()..color = const Color(0xFFD32F2F);
    final skinPaint = Paint()..color = const Color(0xFFFFCCBC);
    final logoRed = Paint()..color = const Color(0xFFD32F2F);
    final logoYellow = Paint()..color = const Color(0xFFFFEB3B);

    canvas.drawCircle(
      Offset(width / 2, height * 0.15),
      width * 0.12,
      skinPaint,
    );

    final bodyRect = Rect.fromLTWH(
      width * 0.3,
      height * 0.25,
      width * 0.4,
      height * 0.4,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(bodyRect, const Radius.circular(10)),
      bodyPaint,
    );

    canvas.drawRect(
      Rect.fromLTWH(width * 0.32, height * 0.65, width * 0.12, height * 0.25),
      bodyPaint,
    );
    canvas.drawRect(
      Rect.fromLTWH(width * 0.56, height * 0.65, width * 0.12, height * 0.25),
      bodyPaint,
    );

    final capePath = Path()
      ..moveTo(width * 0.3, height * 0.25)
      ..lineTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width * 0.7, height * 0.25)
      ..close();
    canvas.drawPath(capePath, capePaint);

    final shieldPath = Path()
      ..moveTo(width / 2, height * 0.32)
      ..lineTo(width * 0.42, height * 0.38)
      ..lineTo(width / 2, height * 0.48)
      ..lineTo(width * 0.58, height * 0.38)
      ..close();
    canvas.drawPath(shieldPath, logoRed);

    final hWidth = width * 0.04;
    final hHeight = height * 0.08;
    final hX = width / 2 - hWidth / 2;
    final hY = height * 0.36 - hHeight / 2;

    canvas.drawRect(
      Rect.fromLTWH(-(hX - 8.5), hY + 2, hWidth * 7.5, 1),
      logoYellow,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        -(hWidth - 3.5),
        hY + hHeight * 0.4,
        hWidth * 2,
        hHeight * 4,
      ),
      logoYellow,
    );
    canvas.drawRect(
      Rect.fromLTWH(
        hX + hWidth + 1,
        hY + hHeight * 0.4,
        hWidth * 2,
        hHeight * 4,
      ),
      logoYellow,
    );

    canvas.restore();
  }

  @override
  void update(double dt) {
    position.x = gameController.playerX;
    position.y = GameController.playerLaneY;
  }
}
