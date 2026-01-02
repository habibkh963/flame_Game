import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ScrollingBackground extends PositionComponent with HasGameRef {
  double scrollSpeed = 200;
  double scrollOffset = 0;

  ScrollingBackground();

  @override
  Future<void> onLoad() async {
    size = gameRef.size;
    position = Vector2.zero();
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.x, size.y),
      Paint()..color = const Color(0xFF333333), // Dark gray
    );

    final paint = Paint()
      ..color = const Color(0xFFFFFF00)
      ..strokeWidth = 4;

    final dashLength = size.x * 0.02; // 2% of width
    final dashGap = size.x * 0.02;

    double x = 0;
    final offset = scrollOffset % (dashLength + dashGap);

    while (x < size.x) {
      canvas.drawLine(
        Offset(x - offset, size.y / 2),
        Offset(x + dashLength - offset, size.y / 2),
        paint,
      );
      x += dashLength + dashGap;
    }

    canvas.drawLine(
      Offset(size.x * 0.05, 0),
      Offset(size.x * 0.05, size.y),
      Paint()
        ..color = Colors.white
        ..strokeWidth = 4,
    );

    canvas.drawLine(
      Offset(size.x * 0.95, 0),
      Offset(size.x * 0.95, size.y),
      Paint()
        ..color = Colors.white
        ..strokeWidth = 4,
    );
  }

  @override
  void update(double dt) {
    scrollOffset += scrollSpeed * dt;

    if (scrollOffset > size.x) {
      scrollOffset = 0;
    }
  }
}
