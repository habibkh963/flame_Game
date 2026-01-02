import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../models/game_controller.dart';
import 'dart:ui' as ui;

/// Meteor obstacle component
class Rocket extends PositionComponent {
  final GameController gameController = GameController();
  late double speed;

  Rocket({required double x, required double y, required this.speed})
    : super(
        position: Vector2(x, y),
        size: Vector2(GameController.rocketWidth, GameController.rocketHeight),
      );

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    const scaleFactor = 1.8;

    canvas.save();

    canvas.translate(width / 2, height / 2);
    canvas.scale(scaleFactor);
    canvas.rotate(3.1415926535); // 180°
    canvas.translate(-width / 2, -height / 2);

    final bodyPaint = Paint()
      ..color = const Color(0xFFE0E0E0)
      ..style = PaintingStyle.fill;

    final nosePaint = Paint()..color = const Color(0xFFFF5252);

    final wingPaint = Paint()..color = const Color(0xFF455A64);

    final flamePaint = Paint()..color = const Color(0xFFFF9800);

    final bodyRect = Rect.fromLTWH(
      width * 0.25,
      height * 0.2,
      width * 0.5,
      height * 0.6,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(bodyRect, const Radius.circular(8)),
      bodyPaint,
    );

    final nosePath = Path()
      ..moveTo(width / 2, 0)
      ..lineTo(width * 0.25, height * 0.2)
      ..lineTo(width * 0.75, height * 0.2)
      ..close();
    canvas.drawPath(nosePath, nosePaint);

    canvas.drawPath(
      Path()
        ..moveTo(width * 0.25, height * 0.6)
        ..lineTo(0, height * 0.8)
        ..lineTo(width * 0.25, height * 0.8)
        ..close(),
      wingPaint,
    );

    canvas.drawPath(
      Path()
        ..moveTo(width * 0.75, height * 0.6)
        ..lineTo(width, height * 0.8)
        ..lineTo(width * 0.75, height * 0.8)
        ..close(),
      wingPaint,
    );

    canvas.drawPath(
      Path()
        ..moveTo(width / 2, height)
        ..lineTo(width * 0.35, height * 0.8)
        ..lineTo(width * 0.65, height * 0.8)
        ..close(),
      flamePaint,
    );

    canvas.restore();
  }

  @override
  void update(double dt) {
    position.y += speed * dt;

    if (gameController.checkCollision(position.x, position.y)) {
      gameController.endGame();
    }
  }

  bool isOffScreen(double screenHeight) {
    return position.y > screenHeight;
  }
}
